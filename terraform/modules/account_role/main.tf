
# Functional role: engineers read/write every layer
module "engineer_role" {
  source = "./modules/account_role"

  name           = "${local.prefix}_ENGINEER"
  comment        = "Read/write on all medallion layers in ${local.prefix}"
  database_roles = module.demo_database.rw_database_roles
  warehouse_name = module.warehouse.name
  parent_role    = "SYSADMIN"
}

# Functional role: analysts read GOLD only
module "analyst_role" {
  source = "./modules/account_role"

  name           = "${local.prefix}_ANALYST"
  comment        = "Read-only on the GOLD layer in ${local.prefix}"
  database_roles = { GOLD = module.demo_database.ro_database_roles["GOLD"] }
  warehouse_name = module.warehouse.name
  parent_role    = "SYSADMIN"
}
