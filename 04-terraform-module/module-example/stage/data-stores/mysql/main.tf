terraform {
  required_version = "~> 0.15"
}

provider "aws" {
  region = "us-east-2"
}

terraform {
  backend "s3" {

  }
}

resource "aws_db_instance" "example" {
  identifier_prefix  = "terraform-up-and-running"
  engine              = "mysql"
  allocated_storage   = 10
  instance_class      = "db.t2.micro"
  name                = var.db_name
  username            = "admin"
  password            = "var.db_password"
  skip_final_snapshot = true
}
