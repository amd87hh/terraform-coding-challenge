

resource "aws_lambda_function" "lambda-py" {
  count = var.create_function ? 1 : 0

  filename         = var.filename
  function_name    = "${var.ressource_name_prefix}-lambda-py"
  handler          = var.handler
  source_code_hash = var.source_code_hash
  role             = var.create_role ? aws_iam_role.lambda[0].arn : var.lambda_role_arn # It is optional to create a new role, or to pass the arn of an existing role
  runtime          = "python3.8"
}
