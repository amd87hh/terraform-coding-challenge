data "aws_region" "current" {}

module "lambda-cron" {
  source = "./modules/lambda-cron"

  create_function = true
  create_role     = true
  create_trigger  = true

  filename         = data.archive_file.lambda_zip.output_path
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
  handler          = "hello_world.lambda_handler"

  schedule_expression   = "cron(0/10 * ? * MON-FRI *)"
  ressource_name_prefix = "dev"

}


# Archive the source code for the lambda function 
data "archive_file" "lambda_zip" {
  type             = "zip"
  source_file      = "${path.module}/data/src/hello_world.py"
  output_file_mode = "0666" #r-w
  output_path      = "${path.module}/data/bin/hello_world.zip"
}
