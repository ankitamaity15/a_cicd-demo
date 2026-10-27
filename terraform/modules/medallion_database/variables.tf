variable "database_name" {
  description = "Snowflake Database Name"
  type        = string
}

variable "data_retention_days" {
  description = "Time Travel retention for the database, in days."
  type        = number
  default     = 1
}

variable "schemas" {
  description = "Medallion layers to create as managed access schemas."
  type        = list(string)
  default     = ["BRONZE", "SILVER", "GOLD"]
}
