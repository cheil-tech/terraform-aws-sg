<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.sg_rule_cidr](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.sg_rule_self](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.sg_rule_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_groups.sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/security_groups) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_env_name"></a> [env\_name](#input\_env\_name) | n/a | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | n/a | `string` | n/a | yes |
| <a name="input_region_name"></a> [region\_name](#input\_region\_name) | n/a | `string` | n/a | yes |
| <a name="input_resource_name"></a> [resource\_name](#input\_resource\_name) | n/a | `string` | n/a | yes |
| <a name="input_sg"></a> [sg](#input\_sg) | n/a | `map` | <pre>{<br>  "create": false,<br>  "desc": "",<br>  "name": "",<br>  "revoke": true<br>}</pre> | no |
| <a name="input_sg_names"></a> [sg\_names](#input\_sg\_names) | n/a | `map` | `{}` | no |
| <a name="input_sg_rule_cidr"></a> [sg\_rule\_cidr](#input\_sg\_rule\_cidr) | n/a | `map` | `{}` | no |
| <a name="input_sg_rule_self"></a> [sg\_rule\_self](#input\_sg\_rule\_self) | n/a | `map` | `{}` | no |
| <a name="input_sg_rule_sg"></a> [sg\_rule\_sg](#input\_sg\_rule\_sg) | n/a | `map` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sg_desc"></a> [sg\_desc](#output\_sg\_desc) | The description of the security group |
| <a name="output_sg_ids"></a> [sg\_ids](#output\_sg\_ids) | The IDs of the security group |
| <a name="output_sg_name"></a> [sg\_name](#output\_sg\_name) | The name of the security group |
| <a name="output_sg_owner_id"></a> [sg\_owner\_id](#output\_sg\_owner\_id) | The owner ID |
| <a name="output_sg_vpc_id"></a> [sg\_vpc\_id](#output\_sg\_vpc\_id) | The VPC ID |
<!-- END_TF_DOCS -->