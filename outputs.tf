output "sg_ids" {
  description = "The IDs of the security group"
  value = {
    for k, v in aws_security_group.this : 
      k => {
        id = v.id
        arn = v.arn 
        desc = v.description
      }
  }
}

output "sg_vpc_id" {
  description = "The VPC ID"
  value       = try(aws_security_group.this[0].vpc_id, "")
}

output "sg_owner_id" {
  description = "The owner ID"
  value       = try(aws_security_group.this[0].owner_id, "")
}

output "sg_name" {
  description = "The name of the security group"
  value       = try(aws_security_group.this[0].name, "")
}

output "sg_desc" {
  description = "The description of the security group"
  value       = try(aws_security_group.this[0].description, "")
}