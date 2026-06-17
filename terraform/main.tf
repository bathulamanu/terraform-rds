data "aws_vpc" "existing" {

  filter {

    name = "tag:Name"

    values = [var.vpc_name]

  }

}

data "aws_subnets" "existing" {

  filter {

    name = "vpc-id"

    values = [data.aws_vpc.existing.id]

  }

}

resource "aws_security_group" "rds_sg" {

  name = var.security_group_name

  vpc_id = data.aws_vpc.existing.id

  ingress {

    from_port = 5432

    to_port = 5432

    protocol = "tcp"

    cidr_blocks = ["10.0.0.0/8"]

  }

  egress {

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]

  }

}

resource "aws_db_subnet_group" "db_subnet" {

  name = var.db_subnet_group_name

  subnet_ids = data.aws_subnets.existing.ids

}

resource "aws_db_instance" "postgres" {

  for_each = var.databases

  identifier = "${each.key}-postgres"

  engine = "postgres"

  instance_class = each.value.instance_class

  allocated_storage = each.value.allocated_storage

  storage_type = var.storage_type

  db_name = each.value.db_name

  username = var.username

  password = var.password

  db_subnet_group_name = aws_db_subnet_group.db_subnet.name

  vpc_security_group_ids = [
    aws_security_group.rds_sg.id
  ]

  publicly_accessible = var.publicly_accessible

  multi_az = var.multi_az

  storage_encrypted = var.storage_encrypted

  backup_retention_period = var.backup_retention_period

  skip_final_snapshot = var.skip_final_snapshot

  deletion_protection = var.deletion_protection

  apply_immediately = var.apply_immediately
}
