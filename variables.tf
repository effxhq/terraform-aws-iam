variable "resource_tags" {
  type = list(object({
    tag-key   = string
    tag-value = string
  }))
  default     = []
  description = "tags to add to the aws effx integration role"
}

variable "external_id" {
  type        = string
  default     = random_string.resource_code.result
  description = "tags to add to the aws effx integration role"
}

