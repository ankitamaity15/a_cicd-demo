# No credentials in code. The provider reads these environment variables, 

# which come from GitHub secrets in the pipeline (or your shell locally): 

#   SNOWFLAKE_ORGANIZATION_NAME, SNOWFLAKE_ACCOUNT_NAME, SNOWFLAKE_USER, 

#   SNOWFLAKE_ROLE, SNOWFLAKE_WAREHOUSE, 

#   SNOWFLAKE_PASSWORD (the Snowflake programmatic access token) 
provider "snowflake" {
  organization_name = var.organization_name
  account   = var.snowflake_account
  user = var.snowflake_user
  password  = var.snowflake_password
  role      = var.snowflake_role
  warehouse = var.snowflake_warehouse
}
