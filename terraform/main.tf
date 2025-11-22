terraform {
  cloud {
    organization = "Maninder"

    workspaces {
      name = "gh-actions-demo"
    }
  }

  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.95"
    }
  }
}

provider "snowflake" {
  username  = var.snowflake_username
  password  = var.snowflake_password
  account   = var.snowflake_account
  role      = var.snowflake_role
 
}

resource "snowflake_sql" "run_sql" {
  name = "run_sql_from_folder"
  sql  = file("${path.module}/sqls/salary_table.sql")
}
