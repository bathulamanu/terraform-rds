variable "aws_region" {}

variable "vpc_name" {}

variable "db_subnet_group_name" {}

variable "security_group_name" {}

variable "storage_type" {}

variable "username" {}

variable "password" {
  sensitive = true
}

variable "publicly_accessible" {}

variable "multi_az" {}

variable "storage_encrypted" {}

variable "backup_retention_period" {}

variable "skip_final_snapshot" {}

variable "deletion_protection" {}

variable "apply_immediately" {}

variable "databases" {

  type = map(object({

    db_name = string

    instance_class = string

    allocated_storage = number

  }))

}
