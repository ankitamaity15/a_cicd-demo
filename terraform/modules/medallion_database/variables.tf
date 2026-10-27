variable "database_name" {
  description = "Snowflake Database Name"
  type        = string
}

variable "data_retention_days" {
  description = "Time Travel retention for the database, in days."
  type        = number
  default     = 1
}
