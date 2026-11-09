# No credentials in code. The provider reads these environment variables, 

# which come from GitHub secrets in the pipeline (or your shell locally): 

#   SNOWFLAKE_ORGANIZATION_NAME, SNOWFLAKE_ACCOUNT_NAME, SNOWFLAKE_USER, 

#   SNOWFLAKE_ROLE, SNOWFLAKE_WAREHOUSE, 

#   SNOWFLAKE_PASSWORD (the Snowflake programmatic access token) 
provider "snowflake" {
  organization_name = var.organization_name
  account_name      = var.account_name

  user      = var.user
  password  = var.password
  role      = var.role
  warehouse = var.warehouse
}
