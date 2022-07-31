# RDS Variables

variable "db_name" {
  description = "Name of DB"
  type        = string
}

variable "db_user" {
  description = "Username for DB"
  type        = string
}

variable "db_pass" {
  description = "Password for DB"
  type        = string
  sensitive   = true
}

# S3 Variables

variable "bucket_name" {
  description = "name of s3 bucket for app data"
  type        = string
}
