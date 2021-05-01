# REQUIRED PARAMETERS
variable "db_password" {
  description = "THe password for the database"
  type = string
}

# OPTIONAL PARAMETERS
variable "db_name" {
  description = "The name to use for the database"
  type = string
  default = "example_database_prod"
}