output "role_name" {
  description = "Name of the Snowflake account role."
  value       = snowflake_account_role.this.name
}
