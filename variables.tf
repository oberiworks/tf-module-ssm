variable "parameters" {
  type        = map
  description = "List of SSM Parameters with format: { name, type, value }"
}

variable "app_name" {
  type = string
}

variable "mod_name" {
  type = string
}

variable "env_name" {
  type = string
}
