output "info" {
  value = { for k, v in module.sgs :
    k => v.info
  }
  description = <<EOT

info = {
  contex = <context info>
  vpc = <vpc info>
  igw = <internet gateway info>

  EOT
}
