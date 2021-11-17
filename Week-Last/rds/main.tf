resource "aws_db_instance" "rds_instance" {
  allocated_storage      = var.aws_db_instance_allocated_storage
  engine                 = "postgres"
  engine_version         = "12.8"
  instance_class         = var.aws_db_instance_instance_class
  name                   = var.rds_access.name
  username               = var.rds_access.user_name
  password               = var.rds_access.password
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.id
  vpc_security_group_ids = [aws_security_group.rds.id]
  skip_final_snapshot    = true
}