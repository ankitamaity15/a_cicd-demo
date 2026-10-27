resource "snowflake_database" "database" {
  name                      = var.database_name
  data_retention_time_in_days = var.data_retention_days
}

resource "snowflake_schema" "this" {
  for_each = toset(var.schemas)

  database = snowflake_database.database.name
  name     = each.value
  comment  = "Managed access schema ${each.value}"
}
