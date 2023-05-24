variable "repository" {
  type        = string
  nullable    = false
  description = "The Github repository which holds the lambda declarations"
}

variable "app_name" {
  type        = string
  nullable    = false
  description = "Application name"
}


variable "fn_name" {
  type        = string
  nullable    = false
  description = "Function name"
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "image_tag" {
  description = "The tag to use for the docker image"
  type        = string
  default     = "dummy_container"
}