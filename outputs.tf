output "info" {
  description = "The IDs of the security group"
  value = {
    for k, v in aws_security_group.this : 
      k => {
        id = v.id
        arn = v.arn 
        desc = v.description
        name = v.name
      }
  }
}
