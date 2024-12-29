variable "name" {
  type = string
}

variable "description" {
  type = string
}

variable "image_uri" {
  type    = string
  default = null
}

variable "image_tag" {
  type    = string
  default = null
}

variable "role_name" {
  type    = string
  default = null
}

variable "docker_context" {
  type = string
}

variable "excluded_paths_for_docker" {
  type = list(string)
  default = ["**/__pycache__/**"]
}

variable "docker_platform" {
  type    = string
  default = "linux/arm64"
}

variable "timeout" {
  type    = number
  default = null
}

variable "maximum_retry_attempts" {
  type    = number
  default = null
}

variable "event_source_crons" {
  type = list(string)
  default = []
}

variable "event_source_alarm_names" {
  type = list(string)
  default = []
}

variable "environment_variables" {
  type = map(string)
  default = {}
}

variable "vpc_subnet_names" {
  type = list(string)
  default = []
}

variable "vpc_security_group_names" {
  type = list(string)
  default = []
}

variable "create_lambda_function_url" {
  type    = bool
  default = false
}

variable "before_build_hook_trigger" {
  type    = any
  default = null
}

variable "before_build_hook_command" {
  type    = string
  default = null
}

variable "memory_size" {
  type    = number
  default = null
}
