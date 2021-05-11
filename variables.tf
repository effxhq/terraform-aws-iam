variable "resource_tags" {
  type = object({})

  default     = {}
  description = "tags to add to the aws effx integration role"
}

variable "enable_ecs" {
  default     = true
  description = "enable or disable the ecs integration"
}

variable "enable_lambda" {
  default     = true
  description = "enable or disable the lambda integration"
}
