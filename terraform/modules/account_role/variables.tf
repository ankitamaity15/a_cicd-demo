variable "role_name" {
  type = string
}

variable "comment" {
  type    = string
  default = null
}

variable "warehouse_name" {
  type    = string
  default = null
}

variable "parent_role" {
  type    = string
  default = null
}

variable "database_roles" {
  type    = map(string)
  default = {}
}
