resource "aws_security_group" "rds" {
  name        = "rds_security_group"
  description = "RDS PostgreSQL server"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name        = "rds_subnet_group"
  description = "RDS subnet group"
  subnet_ids  = var.private_subnets_ids
}