variable "filename" {
  description = "Path to the function's deployment package within the local filesystem"
  type        = string
}

variable "source_code_hash" {
  description = "Source code hash of the Lambda Function which should be created"
  type        = string
}

variable "handler" {
  description = "Hadler of the Lambda Function which should be created"
  type        = string
}


variable "create_function" {
  description = "Controls whether Lambda Function resource should be created"
  type        = bool
  default     = true
}

variable "create_role" {
  description = "Controls whether IAM role for Lambda Function should be created"
  type        = bool
  default     = true
}

variable "create_trigger" {
  description = "Controls whether EvenBridge trigger for Lambda Function should be created"
  type        = bool
  default     = true
}

# We can attach an existing IAM Role to the Lambda Function, instead of creating a new one.
variable "lambda_role_arn" {
  description = "Existing IAM role ARN attached to the Lambda Function."
  type        = string
  default     = ""
}

variable "schedule_expression" {
  description = "Schedule expression which controlls the invocation of the Lambda Function"
  type        = string
  sensitive   = true
}

variable "ressource_name_prefix" {
  description = " Prefix for all ressources created by Terraform"
  type        = string
  default     = ""
}


