# No credentials in code. The provider reads these environment variables, 

# which come from GitHub secrets in the pipeline (or your shell locally): 

#   SNOWFLAKE_ORGANIZATION_NAME, SNOWFLAKE_ACCOUNT_NAME, SNOWFLAKE_USER, 

#   SNOWFLAKE_ROLE, SNOWFLAKE_WAREHOUSE, 

#   SNOWFLAKE_PASSWORD (the Snowflake programmatic access token) 
provider "snowflake" {
  SNOWFLAKE_ACCOUNT   = var.snowflake_account
  SNOWFLAKE_USER = var.snowflake_user
  SNOWFLAKE_PASSWORD = var.snowflake_password
  SNOWFLAKE_ROLE     = var.snowflake_role
  SNOWFLAKE_WAREHOUSE = var.snowflake_warehouse
}
