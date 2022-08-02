terraform {
  cloud {
    organization = "domonkospapp"
    workspaces {
      name = "first-workspace"
    }
  }
}

provider "aws" {
  region = var.region
}

module "web_app_1" {
  source = "./web-application-module"

  # Input Variables
  bucket_name      = "${var.bucket_name}-1"
  app_name         = "app-1"
  environment_name = "production"
  # instance_type    = "t2.small"
  db_name          = var.db_name
  db_user          = var.db_user
  db_pass          = var.db_pass_1
}

module "web_app_2" {
  source = "./web-application-module"

  # Input Variables
  bucket_name      = "${var.bucket_name}-2"
  app_name         = "app-2"
  environment_name = "production"
  # instance_type    = "t2.small"
  db_name          = var.db_name
  db_user          = var.db_user
  db_pass          = var.db_pass_2
}