provider "aws" {
  region = local.region
}

terraform {
  backend "s3" {
    bucket = "dtdev-terraform-state"
    key    = "tf-modules/sg.state"
    region = "ap-northeast-2"
  }
}

locals {
  # workspace = terraform.workspace
  config_file = "${var.config_dir}/${terraform.workspace}.yml"
  config      = yamldecode(file(local.config_file))

  context = local.config.context
  vpc     = local.config.vpc
  region  = local.context.region

  sg_rules_cidr = { for sg_name, rules in local.config.rules :
    sg_name => flatten([ for rule_name, rule in rules :
      [ for src in rule.src : 
        {
          data = rule.data
          port = {
            from = local.config.port[rule.port.from]
            to   = local.config.port[rule.port.to]
          }
          src = {
            val  = try(src.src_val,null)
            desc = "${rule.desc} - ${src.desc}"
          }
        }
      ]
    if rule.data.src_type == "cidr"
    ])
  }

  sg_rules_sg = { for sg_name, rules in local.config.rules :
    sg_name => flatten([ for rule_name, rule in rules :
      [ for src in rule.src : 
        {
          data = rule.data
          port = {
            from = local.config.port[rule.port.from]
            to   = local.config.port[rule.port.to]
          }
          src = {
            val  = try(src.src_val,null)
            desc = "${rule.desc} - ${src.desc}"
          }
        }
      ]
    if rule.data.src_type == "sg" || rule.data.src_type == "self"
    ])
  }

}

# output "d" { value = local.sg_rules }
module "sgs" {
  source = "../../sg"

  for_each = local.config.sgs

  region_name   = local.context.region_name
  project_name  = local.context.project_name
  env_name      = local.context.env_name
  resource_name = local.context.resource_name

  vpc_id = local.vpc.id
  name   = each.key
  sg     = each.value.data

  rules_sg   = local.sg_rules_sg[each.key]
  rules_cidr = local.sg_rules_cidr[each.key]

}