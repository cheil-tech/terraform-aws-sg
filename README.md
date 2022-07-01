<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

The following providers are used by this module:

- <a name="provider_aws"></a> [aws](#provider_aws)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) (resource)
- [aws_security_group_rule.sg_rule_cidr](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) (resource)
- [aws_security_group_rule.sg_rule_self](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) (resource)
- [aws_security_group_rule.sg_rule_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_env_name"></a> [env_name](#input_env_name)

Description: n/a

Type: `string`

### <a name="input_project_name"></a> [project_name](#input_project_name)

Description: n/a

Type: `string`

### <a name="input_region_name"></a> [region_name](#input_region_name)

Description: n/a

Type: `string`

### <a name="input_resource_name"></a> [resource_name](#input_resource_name)

Description: n/a

Type: `string`

### <a name="input_vpc_id"></a> [vpc_id](#input_vpc_id)

Description: n/a

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_sg"></a> [sg](#input_sg)

Description: n/a

Type: `map`

Default:

```json
{
  "create": false,
  "desc": "",
  "name": "",
  "revoke": true
}
```

### <a name="input_sg_names"></a> [sg_names](#input_sg_names)

Description: n/a

Type: `map`

Default: `{}`

### <a name="input_sg_rule_cidr"></a> [sg_rule_cidr](#input_sg_rule_cidr)

Description: n/a

Type: `map`

Default: `{}`

### <a name="input_sg_rule_self"></a> [sg_rule_self](#input_sg_rule_self)

Description: n/a

Type: `map`

Default: `{}`

### <a name="input_sg_rule_sg"></a> [sg_rule_sg](#input_sg_rule_sg)

Description: n/a

Type: `map`

Default: `{}`

## Outputs

The following outputs are exported:

### <a name="output_info"></a> [info](#output_info)

Description: The IDs of the security group
<!-- END_TF_DOCS -->