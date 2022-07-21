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
- [aws_security_group_rule.cidr](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) (resource)
- [aws_security_group_rule.sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) (resource)
- [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/security_group) (data source)

## Required Inputs

The following input variables are required:

### <a name="input_env_name"></a> [env_name](#input_env_name)

Description: Name of environment (QA/STG/PRD/...)

Type: `string`

### <a name="input_name"></a> [name](#input_name)

Description: Name of this subnet

Type: `string`

### <a name="input_project_name"></a> [project_name](#input_project_name)

Description: Name of project

Type: `string`

### <a name="input_region_name"></a> [region_name](#input_region_name)

Description: Name of region which will be applied resources

Type: `string`

### <a name="input_resource_name"></a> [resource_name](#input_resource_name)

Description: Name of resource

Type: `string`

### <a name="input_sg"></a> [sg](#input_sg)

Description:
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

Type: `any`

### <a name="input_vpc_id"></a> [vpc_id](#input_vpc_id)

Description: VPC id for this subnet

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_rules_cidr"></a> [rules_cidr](#input_rules_cidr)

Description:
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

Type: `list`

Default: `[]`

### <a name="input_rules_sg"></a> [rules_sg](#input_rules_sg)

Description:
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

Type: `list`

Default: `[]`

## Outputs

The following outputs are exported:

### <a name="output_info"></a> [info](#output_info)

Description:   
data.aws_security_group.this

### <a name="output_rules"></a> [rules](#output_rules)

Description: n/a
<!-- END_TF_DOCS -->