terraform {
  cloud {
    organization = "domonkospapp"
    workspaces {
      name = "production-workspace"
    }
  }
}

provider "aws" {
  region = var.region
}

locals {
  environment_name = "production"
}

module "web_app" {
  source = "../web-application-module"

  # Input Variables
  bucket_name      = "${var.bucket_name}-1"
  app_name         = "app-1"
  environment_name = "production"
  # instance_type    = "t2.small"
  db_name          = "${local.environment_name}${var.db_name}"
  db_user          = var.db_user
  db_pass          = var.db_pass
}