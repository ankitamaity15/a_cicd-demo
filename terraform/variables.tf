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
  default     = ["RAW", "CONFIRMED", "BUSINESS"]
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


variable "data_retention_days" {
  description = "Time Travel retention for the database, in days."
  type        = number
  default     = 1
}

variable "organization_name" {
  type = string
}

variable "account_name" {
  type = string
}

variable "user" {
  type = string
}

variable "password" {
  type      = string
  sensitive = true
}

variable "role" {
  type = string
}

variable "warehouse" {
  type = string
}

