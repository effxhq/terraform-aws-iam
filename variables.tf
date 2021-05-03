variable "resource_tags" {
  type = object({})

  default     = {}
  description = "tags to add to the aws effx integration role"
}
