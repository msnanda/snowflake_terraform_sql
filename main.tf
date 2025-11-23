terraform {
  cloud {
    organization = "Maninder"

    workspaces {
      name = "snowflake-terraform-sql"
    }
  }

  required_providers {
    snowflake = {
      source  = "snowflakedb/snowflake"
      version = "~> 0.80"
    }
  }
}

provider "snowflake" {
  username  = var.snowflake_username
  password  = var.snowflake_password
  account_name   = "HO60700"
  organization_name = "ISMAODC"
  role      = "ACCOUNTADMIN"
}

resource "snowflake_sql_statement" "run_sql" {
  name = "run_sql_from_folder"
  sql  = file("${path.module}/sqls/salary_table.sql")
}
