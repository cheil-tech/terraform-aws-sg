locals {
  # vpc_id = var.vpc_id
  # az_info = [
  #     for az in var.azs : "${var.region}-${az}"
  # ]
  name_tag_prefix = "${var.project_name}-${var.env_name}"

  tags = {
    ProjectName  = var.project_name
    ResourceName = var.resource_name
    EnvName      = var.env_name
  }
}

# data "aws_security_groups" "sg" {
#   filter {
#     name   = "vpc-id"
#     values = ["${var.vpc_id}"]
#   }
# }

resource "aws_security_group" this {
  for_each = var.sg_names

  vpc_id = var.vpc_id
  name   = each.key

  description            = each.value.desc
  revoke_rules_on_delete = each.value.revoke

  tags = merge(
    {
      Name = "${local.name_tag_prefix}-${each.key}-sg"
    },
    local.tags
  )
}

# sg_id = {
#   type = "ingress"
#   port = {
#     from = -1
#     to = -1
#   }
#   protocol = "tcp"
#   src = []
#   desc = ""
# }
resource "aws_security_group_rule" "sg_rule_cidr" {
  for_each = var.sg_rule_cidr
  
  security_group_id = each.value.sg_id

  type        = each.value.type
  cidr_blocks = each.value.src
  from_port   = each.value.port.from
  to_port     = each.value.port.to
  protocol    = each.value.protocol
  description = "${each.value.desc}"
}

resource "aws_security_group_rule" "sg_rule_sg" {
  for_each = var.sg_rule_sg

  security_group_id = each.value.sg_id

  type                     = each.value.type
  source_security_group_id = each.value.src
  from_port                = each.value.port.from
  to_port                  = each.value.port.to
  protocol                 = each.value.protocol
  description              = "${each.value.desc}"
}

resource "aws_security_group_rule" "sg_rule_self" {
  for_each = var.sg_rule_self

  security_group_id = each.value.sg_id

  type        = each.value.type
  from_port   = each.value.port.from
  to_port     = each.value.port.to
  protocol    = each.value.protocol
  description = "${each.value.desc}"
}
