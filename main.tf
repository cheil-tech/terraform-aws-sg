locals {
  name_tag_prefix = "${var.project_name}-${var.env_name}"

  tags = {
    ProjectName  = var.project_name
    ResourceName = var.resource_name
    EnvName      = var.env_name
  }

  sg_id = var.sg.create ? aws_security_group.this[0].id : var.sg.id
}

data aws_security_group "this" {
  id = local.sg_id
}

resource "aws_security_group" this {
  count = var.sg.create ? 1 : 0

  vpc_id = var.vpc_id
  name   = var.name

  description            = var.sg.info.desc
  revoke_rules_on_delete = var.sg.info.revoke

  tags = merge(
    {
      Name = "${local.name_tag_prefix}-${var.name}-sg"
    },
    local.tags
  )
}

resource "aws_security_group_rule" "sg" {
  # for_each = toset(var.rules)
  count = length(var.rules_sg)

  security_group_id = local.sg_id

  source_security_group_id = var.rules_sg[count.index].data.src_type == "sg"   ? var.rules_sg[count.index].src.val : null
  self                     = var.rules_sg[count.index].data.src_type == "self" ? true : null

  type        = var.rules_sg[count.index].data.type
  from_port   = var.rules_sg[count.index].port.from
  to_port     = var.rules_sg[count.index].port.to
  protocol    = var.rules_sg[count.index].data.protocol
  description = var.rules_sg[count.index].src.desc
}

resource "aws_security_group_rule" "cidr" {
  # for_each = toset(var.rules)
  count = length(var.rules_cidr)

  security_group_id = local.sg_id

  #source_security_group_id = null
  cidr_blocks              = var.rules_cidr[count.index].data.src_type == "cidr" ? var.rules_cidr[count.index].src.val : null

  type        = var.rules_cidr[count.index].data.type
  from_port   = var.rules_cidr[count.index].port.from
  to_port     = var.rules_cidr[count.index].port.to
  protocol    = var.rules_cidr[count.index].data.protocol
  description = var.rules_cidr[count.index].src.desc
}
