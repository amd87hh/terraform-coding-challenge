# AWS Lambda Terraform module

Terraform module, which creates a lambda function defined by the user. The lambda function is triggered by AWS Eventbridge and logs the function output to CloudWatch. It is possible to define which ressources (lambda function, iam role, eventbridge trigger) should be created, and to pass an existing iam role.

## Coding Challenge General

- Da ich bisher nicht mit Lambda in Terraform gearbeitet habe, habe ich diesen [Medium Artikel](https://medium.com/geekculture/terraform-setup-for-scheduled-lambda-functions-f01931040007) und dieses [TF Modul](https://github.com/terraform-aws-modules/terraform-aws-lambda) als Basis verwendet.

- In meiner Lösung kann der Nutzer des Moduls den Python Code selber definieren.

- Die AWS Region wird per Data Source - ```data "aws_region" "current" {}``` ausgewertet, und als Output angezeigt.
  
- Zu der Versioning Strategie kann ich wenig sagen, da ich bisher nur von lokal aus deployed habe, und das CI/CD des TF Code noch aussteht.
  Was ich vorhabe (falls das zur Versioning Strategie zählt) ist Gitlab als eine Terraform Modul Registry zu nutzen.
  Außerem kann Gitlab auch als Backend für die TF State verwendet werden (anstatt S3). So wird nur noch der Live Code, welcher das Modul verwendet, eingecheckt.

## Requirements

| Name                                                                      | Version  |
| ------------------------------------------------------------------------- | -------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0 |
| <a name="requirement_archive"></a> [archive](#requirement\_archive)       | >= 2.2.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws)                   | >= 4.0.0 |

## Providers

| Name                                                          | Version |
| ------------------------------------------------------------- | ------- |
| <a name="provider_archive"></a> [archive](#provider\_archive) | 2.2.0   |
| <a name="provider_aws"></a> [aws](#provider\_aws)             | 4.34.0  |

## Modules

| Name                                                                  | Source                | Version |
| --------------------------------------------------------------------- | --------------------- | ------- |
| <a name="module_lambda-cron"></a> [lambda-cron](#module\_lambda-cron) | ./modules/lambda-cron | n/a     |

## Resources

| Name                                                                                                               | Type        |
| ------------------------------------------------------------------------------------------------------------------ | ----------- |
| [archive_file.lambda_zip](https://registry.terraform.io/providers/hashicorp/archive/latest/docs/data-sources/file) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region)        | data source |

## Inputs

No inputs.

## Outputs

| Name                                                                                              | Description                                                  |
| ------------------------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| <a name="output_aws_region"></a> [aws\_region](#output\_aws\_region)                              | AWS Region                                                   |
| <a name="output_lambda_function_arn"></a> [lambda\_function\_arn](#output\_lambda\_function\_arn) | Amazon Resource Name (ARN) identifying your Lambda Function. |