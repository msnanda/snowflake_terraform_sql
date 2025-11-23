variable "snowflake_password" {
  description = "Password for Snowflake user"
  type        = string
  sensitive   = true
}

variable "snowflake_username" {
  description = "Username for Snowflake"
  type        = string
}

variable "snowflake_account" {
  description = "Account for Snowflake"
  type        = string
}

variable "snowflake_role" {
  description = "Role for Snowflake"
  type        = string
}