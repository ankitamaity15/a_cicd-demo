resource "snowflake_database" "ankita_test_db" {
  name = "ANKITA_TEST_DB"

  comment = "Database created via Terraform for testing"

  data_retention_time_in_days = 1
}
