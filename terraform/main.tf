module "demo_database" {
  source = "./modules/medallion_database"

  database_name = var.database_name
}

module "warehouse" {
  source = "./modules/warehouse"

  warehouse_name = var.warehouse_name
}

module "analyst_role" {
  source = "./modules/account_role"

  role_name = var.analyst_role_name
}

module "engineer_role" {
  source = "./modules/account_role"

  role_name = var.engineer_role_name
}
