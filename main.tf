terraform {
  cloud {
    organization = "Maninder"

    workspaces {
      name = "gh-actions-demo"
    }
  }

  required_providers {
    # Use the official Snowflake provider package for Terraform 0.13+
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.25.17"
    }
    null = {
      source  = "hashicorp/null"
      version = "3.1.1"
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
