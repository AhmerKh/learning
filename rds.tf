resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "db-subnet-group"
  subnet_ids = [aws_default_subnet.default_subnet_a.id, aws_default_subnet.default_subnet_b.id]
}

provider "aws" {
  region = "us-east-1"
  alias  = "replica"
}


resource "aws_db_instance" "rds" {
  allocated_storage       = 5
  db_name                 = "mydb"
  db_subnet_group_name    = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids  = [aws_security_group.service_security_group.id]
  engine                  = "mysql"
  backup_retention_period = 7
  engine_version          = "8.0"
  instance_class          = "db.t2.micro"
  identifier              = "rds-instance"
  username                = "foo"
  password                = "foobarbaz"
  parameter_group_name    = "default.mysql8.0"
  skip_final_snapshot     = true
  publicly_accessible     = true
}

data "aws_db_instance" "rds" {
  db_instance_identifier = aws_db_instance.rds.identifier
}





# resource "aws_db_instance_automated_backups_replication" "default" {
#   source_db_instance_arn = aws_db_instance.rds.arn
# 
#   provider = aws.replica
# }
# 
# 
# resource "aws_db_instance" "rds-replica" {
#   replicate_source_db        = aws_db_instance.rds.identifier
#   replica_mode               = "mounted"
#   auto_minor_version_upgrade = false
#   backup_retention_period    = 7
#   identifier                 = "rds-instance-replica"
#   instance_class             = aws_db_instance.rds.instance_class
#   multi_az                   = false # Custom for Oracle does not support multi-az
#   skip_final_snapshot        = true
# 
# }
# 