aws_region = "ap-south-1"

vpc_name = "theinstacloset-vpc"

db_subnet_group_name = "theinstacloset-db-subnet"

security_group_name = "theinstacloset-rds-sg"

storage_type = "gp3"

username = "insta"

password = "Bathula147!"

publicly_accessible = false

multi_az = false

storage_encrypted = true

backup_retention_period = 7

skip_final_snapshot = true

deletion_protection = false

apply_immediately = true

databases = {

  theinstacloset = {

    db_name = "theinstacloset"

    instance_class = "db.t3.small"

    allocated_storage = 20

  }
}
