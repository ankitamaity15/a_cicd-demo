resource "snowflake_database" "database" {
  name                      = var.database_name
  data_retention_time_in_days = var.data_retention_days
}
