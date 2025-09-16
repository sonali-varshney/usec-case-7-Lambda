<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_apigateway"></a> [apigateway](#module\_apigateway) | ./api-gateway | n/a |
| <a name="module_iam"></a> [iam](#module\_iam) | ./iam | n/a |
| <a name="module_lambda"></a> [lambda](#module\_lambda) | ./lambda | n/a |
| <a name="module_secgp"></a> [secgp](#module\_secgp) | ./secgp | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./vpc | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | n/a | `string` | `"10.0.0.0/16"` | no |
| <a name="input_igw_name"></a> [igw\_name](#input\_igw\_name) | n/a | `string` | `"myigw"` | no |
| <a name="input_prv_availability_zone"></a> [prv\_availability\_zone](#input\_prv\_availability\_zone) | n/a | `string` | `"us-east-1c"` | no |
| <a name="input_prv_cidr_block"></a> [prv\_cidr\_block](#input\_prv\_cidr\_block) | n/a | `list` | <pre>[<br/>  "10.0.2.0/24"<br/>]</pre> | no |
| <a name="input_pub_availability_zone"></a> [pub\_availability\_zone](#input\_pub\_availability\_zone) | n/a | `string` | `"us-east-1a"` | no |
| <a name="input_pub_cidr_block"></a> [pub\_cidr\_block](#input\_pub\_cidr\_block) | n/a | `list` | <pre>[<br/>  "10.0.0.0/24"<br/>]</pre> | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | n/a | `string` | `"myvpc"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->