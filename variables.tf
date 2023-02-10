variable "repository" {
  type        = string
  nullable    = false
  description = "The Github repository which holds the lambda declarations"
}

variable "fn_name" {
  type        = string
  nullable    = false
  description = "Function name"
}
