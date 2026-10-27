variable "project" {
  description = "Project name, used as the database and role prefix."
  type        = string
  default     = "THREEIGROUP"
}

variable "environment" {
  description = "Deployment environment: dev, test or prod."
  type        = string

  validation {
    condition     = contains(["dev", "test", "prod"], var.environment)
    error_message = "The environment must be dev, test or prod."
  }
}

variable "schemas" {
  description = "Medallion layers, each created as a managed access schema."
  type        = list(string)
  default     = ["BRONZE", "SILVER", "GOLD"]
}

variable "warehouse_size" {
  description = "Size of the environment warehouse."
  type        = string
  default     = "XSMALL"
}

variable "warehouse_auto_suspend" {
  description = "Seconds of inactivity before the warehouse suspends."
  type        = number
  default     = 60
}

variable "snowflake_account" {
  type = string
}

variable "snowflake_user" {
  type = string
}

variable "snowflake_password" {
  type = string
}

variable "snowflake_role" {
  type = string
}

variable "snowflake_warehouse" {
  type = string
}

variable "data_retention_days" {
  description = "Time Travel retention for the database, in days."
  type        = number
  default     = 1
}
