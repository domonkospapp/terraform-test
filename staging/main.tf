terraform {
  cloud {
    organization = "domonkospapp"
    workspaces {
      name = "staging-workspace"
    }
  }
}

provider "aws" {
  region = var.region
}

locals {
  environment_name = "staging"
}

module "web_app" {
  source = "../web-application-module"

  # Input Variables
  bucket_name      = "${var.bucket_name}-1"
  app_name         = "app-1"
  environment_name = "staging"
  # instance_type    = "t2.small"
  db_name          = "${local.environment_name}${var.db_name}"
  db_user          = var.db_user
  db_pass          = var.db_pass
}

output "web_app_module" {  
  value = module.web_app  
}