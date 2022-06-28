variable "vpc_id" { type = string}
variable "resource_name" { type = string }
variable "region_name" { type = string }
variable "project_name" { type = string }
variable "env_name" { type = string }

variable "sg" { 
  type = map
  default = {
    create = false
    name = ""
    desc = ""
    revoke = true
  }
}

variable "sg_names" {
  default = {}
  /*default = {
    name = {
      desc = ""
      revoke = true
    }
  }*/
}

variable "sg_rule_cidr" {
  default = {}
  /*default = {
    id = {
      sg_id = ""
      type = "ingress"
      port = {
        from = -1
        to = -1
      }
      protocol = "tcp"
      src = []
      desc = ""
    }
  }*/
}

variable "sg_rule_sg" {
  default = {}
  /*default = {
    sg_id = {
      type = "ingress"
      port = {
        from = -1
        to = -1
      }
      protocol = "tcp"
      src = ""
      desc = ""
    }
  }*/
}

variable "sg_rule_self" {
  default = {}
  /*default = {
    sg_id = {
      type = "ingress"
      port = {
        from = -1
        to = -1
      }
      protocol = "tcp"
      desc = ""
    }
  }*/
}