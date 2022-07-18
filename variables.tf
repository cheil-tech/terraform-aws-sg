variable "resource_name" {
  description = "Name of resource"
  type = string
}
variable "region_name" {
  description = "Name of region which will be applied resources"
  type = string
}
variable "project_name" {
  description = "Name of project"
  type = string
}
variable "env_name" {
  description = "Name of environment (QA/STG/PRD/...)"
  type = string
}

variable "vpc_id" { 
  description = "VPC id for this subnet"
  type = string
}
variable "name" {
  description = "Name of this subnet"
  type = string
}

variable "sg" {
  description = <<EOD

- Mandatory if starts with *
- {default|*}({type}-{default}:{constraint1}/{constraint2}/..)

```
  default = {
    create = *(bool)
    id = null(string)
    info = {
      desc = *(string)
      revoke = true(bool)
    }
  }
```

EOD
}
variable "rules_sg" {
  default = []
  description = <<EOD

- SG rules for security group or self type rule
- Mandatory if starts with *
- {default|*}({type}-{default}:{constraint1}/{constraint2}/..)

```
  default = [
    {
      data = {
        type = *(string-ingress/egress)
        protocol = "tcp"
        src_type = *(string-sg/cidr/self)
      }
      port = {
        from = 0(number--1~65,536)
        to = 0(number--1~65,536)
      }
      src= {
        data = *(null|list|string)
        desc = null(string)
      }
    }
    ...
  ]
```

EOD
}
variable "rules_cidr" {
  default = []
  description = <<EOD

- SG rules for cidr type rule
- Mandatory if starts with *
- {default|*}({type}-{default}:{constraint1}/{constraint2}/..)

```
  default = [
    {
      data = {
        type = *(string-ingress/egress)
        protocol = "tcp"
        src_type = *(string-sg/cidr/self)
      }
      port = {
        from = 0(number--1~65,536)
        to = 0(number--1~65,536)
      }
      src= {
        data = *(null|list|string)
        desc = null(string)
      }
    }
    ...
  ]
```

EOD
}
