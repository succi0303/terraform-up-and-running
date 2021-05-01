# REQUIRED PARAMETERS
variable "db_password" {
  description = "The password for the database"
  type = string
}

# OPTIONAL PARAMETERS
variable "db_name" {
  description = "The name for use for the database"
  type = string
  default = "example_database_name"
}