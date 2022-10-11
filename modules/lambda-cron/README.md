## Requirements

| Name                                                                      | Version  |
| ------------------------------------------------------------------------- | -------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0 |
| <a name="requirement_archive"></a> [archive](#requirement\_archive)       | >= 2.2.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws)                   | >= 4.0.0 |

## Providers

| Name                                              | Version |
| ------------------------------------------------- | ------- |
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.34.0  |

## Modules

No modules.

## Resources

| Name                                                                                                                                                     | Type        |
| -------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [aws_cloudwatch_event_rule.schedule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_rule)                  | resource    |
| [aws_cloudwatch_event_target.schedule_lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_target)       | resource    |
| [aws_iam_role.lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role)                                              | resource    |
| [aws_lambda_function.lambda_py](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function)                             | resource    |
| [aws_lambda_permission.allow_events_bridge_to_run_lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource    |
| [aws_iam_policy_document.assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document)                | data source |
| [aws_iam_policy_document.cw_policy_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document)         | data source |

## Inputs

| Name                                                                                                  | Description                                                               | Type     | Default | Required |
| ----------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------- | -------- | ------- | :------: |
| <a name="input_create_function"></a> [create\_function](#input\_create\_function)                     | Controls whether Lambda Function resource should be created               | `bool`   | `true`  |    no    |
| <a name="input_create_role"></a> [create\_role](#input\_create\_role)                                 | Controls whether IAM role for Lambda Function should be created           | `bool`   | `true`  |    no    |
| <a name="input_create_trigger"></a> [create\_trigger](#input\_create\_trigger)                        | Controls whether EvenBridge trigger for Lambda Function should be created | `bool`   | `true`  |    no    |
| <a name="input_filename"></a> [filename](#input\_filename)                                            | Path to the function's deployment package within the local filesystem     | `string` | n/a     |   yes    |
| <a name="input_handler"></a> [handler](#input\_handler)                                               | Hadler of the Lambda Function which should be created                     | `string` | n/a     |   yes    |
| <a name="input_lambda_role_arn"></a> [lambda\_role\_arn](#input\_lambda\_role\_arn)                   | Existing IAM role ARN attached to the Lambda Function.                    | `string` | `""`    |    no    |
| <a name="input_ressource_name_prefix"></a> [ressource\_name\_prefix](#input\_ressource\_name\_prefix) | Prefix for all ressources created by Terraform                            | `string` | `""`    |    no    |
| <a name="input_schedule_expression"></a> [schedule\_expression](#input\_schedule\_expression)         | Schedule expression which controlls the invocation of the Lambda Function | `string` | n/a     |   yes    |
| <a name="input_source_code_hash"></a> [source\_code\_hash](#input\_source\_code\_hash)                | Source code hash of the Lambda Function which should be created           | `string` | n/a     |   yes    |

## Outputs

| Name                                                                                              | Description                                                  |
| ------------------------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| <a name="output_lambda_function_arn"></a> [lambda\_function\_arn](#output\_lambda\_function\_arn) | Amazon Resource Name (ARN) identifying your Lambda Function. |