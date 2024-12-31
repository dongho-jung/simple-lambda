########################
# Required Variables
########################
variable "name" {
  type        = string
  description = "Name of lambda function"
}

variable "description" {
  type        = string
  description = "Description of lambda function"
}


########################
# Optional Variables - Common
########################
variable "environment_variables" {
  type        = map(string)
  default     = {}
  description = "Environment variables of lambda function"
}

variable "memory_size" {
  type        = number
  default     = null
  description = "Memory size of lambda function"
}

variable "timeout" {
  type        = number
  default     = null
  description = "Timeout of lambda function"
}

variable "target_arch" {
  type        = string
  default     = "linux/arm64"
  description = "Target architecture of lambda function"
}

variable "maximum_retry_attempts" {
  type        = number
  default     = null
  description = "Maximum retry attempts of lambda function"
}


########################
# Optional Variables - Using
########################
variable "using_uv" {
  type        = bool
  default     = false
  description = "Predefined settings for python uv"
}


########################
# Optional Variables - IAM
########################
variable "iam_role_name" {
  type        = string
  default     = null
  description = "IAM Role name of lambda function, if exists"
}

variable "iam_policy_arns" {
  type        = list(string)
  default     = [
    "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  ]
  description = "IAM policy arns of lambda function"
}

variable "iam_statements" {
  type        = any
  default     = {}
  description = "IAM policy statements of lambda function"
}


########################
# Optional Variables - Event Source
########################
variable "event_source_crons" {
  type        = list(string)
  default     = []
  description = "Event source crons of lambda function"
}

variable "event_source_cloudwatch_alarm_names" {
  type        = list(string)
  default     = []
  description = "Event source cloudwatch alarm names of lambda function"
}


########################
# Optional Variables - Network
########################
variable "vpc_name" {
  type        = string
  default     = null
  description = "value"
}

variable "vpc_subnet_names" {
  type        = list(string)
  default     = []
  description = "VPC Subnet names of lambda function, if needed"
}

variable "vpc_security_group_names" {
  type    = list(string)
  default = []
}

variable "create_lambda_function_url" {
  type    = bool
  default = false
}


########################
# Optional Variables - Docker Build
########################
variable "path_to_dockerfile_dir" {
  type        = string
  default     = "./src"
  description = "Path to directory containing the Dockerfile"
}