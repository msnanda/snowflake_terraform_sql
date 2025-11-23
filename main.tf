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

resource "null_resource" "run_sql" {
  provisioner "local-exec" {
    command = <<EOT
    snowsql -a ${var.snowflake_account} -u ${var.snowflake_username} -p ${var.snowflake_password} -r ${var.snowflake_role} -f "${path.module}/sqls/salary_table.sql"
    EOT
  }
}

