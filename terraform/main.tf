locals {
  env_upper = upper(var.environment)
  prefix    = "${upper(var.project)}_${local.env_upper}" # e.g. TEST_CICD_DEMO_TEST
}

# Compute for this environment
module "warehouse" {
  source = "./modules/warehouse"

  name         = "${local.prefix}_WH"
  size         = var.warehouse_size
  auto_suspend = var.warehouse_auto_suspend
}

# Database with BRONZE / SILVER / GOLD managed access schemas and access roles
# terraform/main.tf
module "demo_database" {
  source = "./modules/medallion_database"

  database_name       = local.prefix
  data_retention_days = var.data_retention_days
}

# Functional role: engineers read/write every layer
module "engineer_role" {
  source = "./modules/account_role"

  role_name           = "${local.prefix}_ENGINEER"
}

# Functional role: analysts read GOLD only

module "analyst_role" {
  source = "./modules/account_role"

  role_name = "${local.prefix}_ANALYST"
}
