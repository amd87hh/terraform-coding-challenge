# IAM Role should be created only, if a Lambda function is created. 
locals {
  create_role = var.create_function && var.create_role
}

# IAM Role for the Lambda function
resource "aws_iam_role" "lambda" {
  count              = local.create_role ? 1 : 0
  name               = "${var.ressource_name_prefix}-lambda"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json

  inline_policy {
    name   = "cw_policy_document"
    policy = data.aws_iam_policy_document.cw_policy_document.json
  }
}

# IAM Trust Relationships - Only Lambda can assume this role.
data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}
# IAM Policy which allow to log into CloudWatch
data "aws_iam_policy_document" "cw_policy_document" {
  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:AssociateKmsKey"
    ]
    resources = ["*"]
  }
}
