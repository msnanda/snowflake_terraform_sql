terraform {
  cloud {
    organization = "Maninder"

    workspaces {
      name = "gh-actions-demo"
    }
  }

  required_providers {
    snowflake = {
      source  = "SnowflakeDB/snowflake"
      version = "1.7"
    }
  }
}

provider "Snowflakedb" {
  username  = "MSNANDA"
  password  = var.snowflake_password
  account   = "HO60700"
  role      = "ACCOUNTADMIN"
}

resource "snowflake_sql" "run_sql" {
  name = "run_sql_from_folder"
  sql  = file("${path.module}/sqls/salary_table.sql")
}
