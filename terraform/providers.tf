# No credentials in code. The provider reads these environment variables, 

# which come from GitHub secrets in the pipeline (or your shell locally): 

#   SNOWFLAKE_ORGANIZATION_NAME, SNOWFLAKE_ACCOUNT_NAME, SNOWFLAKE_USER, 

#   SNOWFLAKE_ROLE, SNOWFLAKE_WAREHOUSE, 

#   SNOWFLAKE_PASSWORD (the Snowflake programmatic access token) 

terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = ">= 1.0.0"
    }
  }
}

provider "snowflake" {
  account   = var.snowflake_account
  username  = var.snowflake_user
  password  = var.snowflake_password
  role      = var.snowflake_role
  warehouse = var.snowflake_warehouse
}
