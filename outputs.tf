output "lambda_function_arn" {
  description = "Amazon Resource Name (ARN) identifying your Lambda Function."
  value       = module.lambda-cron.lambda_function_arn
}

output "aws_region" {
  description = "AWS Region"
  value       = data.aws_region.current.name
}