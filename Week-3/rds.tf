resource "aws_db_instance" "demo_db" {
  allocated_storage = var.aws_db_instance_allocated_storage
  engine            = "postgres"
  engine_version    = "12.8"
  instance_class    = var.aws_db_instance_instance_class
  username               = var.aws_db_instance_username
  password               = var.aws_db_instance_password
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.id
  vpc_security_group_ids = [aws_security_group.rds.id]
  skip_final_snapshot    = true
}