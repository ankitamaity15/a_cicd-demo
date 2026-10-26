resource "snowflake_account_role" "roles" {
  for_each = toset(var.roles)

  name = each.value
}
