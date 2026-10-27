# No credentials in code. The provider reads these environment variables, 

# which come from GitHub secrets in the pipeline (or your shell locally): 

#   SNOWFLAKE_ORGANIZATION_NAME, SNOWFLAKE_ACCOUNT_NAME, SNOWFLAKE_USER, 

#   SNOWFLAKE_ROLE, SNOWFLAKE_WAREHOUSE, 

#   SNOWFLAKE_PASSWORD (the Snowflake programmatic access token) 
provider "snowflake" {
  account = var.SNOWFLAKE_ACCOUNT
  username = var.SNOWFLAKE_USER
  password = var.SNOWFLAKE_PASSWORD
  role = var.SNOWFLAKE_ROLE 
  warehause = var.SNOWFLAKE_WAREHOUSE
}
