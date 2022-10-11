# Evenbridge Trigger should be created only, if a Lambda function is created
locals {
  create_trigger = var.create_function && var.create_trigger
}

# Define a rule with the relevant schedule expression which is passed into the module
resource "aws_cloudwatch_event_rule" "schedule" {
  count               = local.create_trigger ? 1 : 0
  
  name                = "${var.ressource_name_prefix}-lambda-schedule"
  description         = "Schedule for Lambda Function"
  schedule_expression = var.schedule_expression
}

# Set Lambda function as target for the created CloudWatch rule
resource "aws_cloudwatch_event_target" "schedule_lambda" {
  count = local.create_trigger ? 1 : 0

  rule      = aws_cloudwatch_event_rule.schedule[0].name
  target_id = "${var.ressource_name_prefix}-lambda-schedule"
  arn       = aws_lambda_function.lambda-py[0].arn
}

# Allow CloudWatch to invoke Lambda
resource "aws_lambda_permission" "allow_events_bridge_to_run_lambda" {
  count = local.create_trigger ? 1 : 0

  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda-py[0].function_name
  principal     = "events.amazonaws.com"
}
