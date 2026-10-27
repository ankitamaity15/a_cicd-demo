output "database_name" {
  description = "Database Name"
  value       = snowflake_database.database.name
}

output "schema_names" {
  description = "Names of the created schemas"
  value       = [for schema in snowflake_schema.this : schema.name]
}
