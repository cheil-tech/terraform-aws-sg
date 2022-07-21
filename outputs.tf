output "info" {
  value = {
    sg = data.aws_security_group.this
  }

  description = <<EOT
info = {
  sg = data.aws_security_group.this
}
EOT
}
