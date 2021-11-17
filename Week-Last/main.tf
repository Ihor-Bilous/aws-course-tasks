provider "aws" {
  region = "us-west-2"
}

module "vpc" {
  source = "./vpc"

  vpc_cidr_block      = var.vpc_cidr_block
  subnets_cidr_blocks = var.subnets_cidr_blocks
  availability_zones  = var.availability_zones

  nat_ec2_instance_id = module.instances.nat_instance_id
}

module "instances" {
  source = "./instances"

  key_name      = var.key_name
  image_id      = var.image_id
  nat_image_id  = var.nat_image_id
  instance_type = var.instance_type
  bucket_name   = var.bucket_name
  rds_address   = module.rds.rds_address

  vpc_id             = module.vpc.vpc_id
  vpc_cidr_block     = var.vpc_cidr_block
  public_subnets_ids = [module.vpc.first_public_subnet_id, module.vpc.second_public_subnet_id]
  private_subnet_id  = module.vpc.first_private_subnet_id
}

module "dynamodb" {
  source = "./dynamodb"

  dynamodb_table_name = var.dynamodb_table_name
}

module "rds" {
  source = "./rds"

  aws_db_instance_allocated_storage = var.aws_db_instance_allocated_storage
  aws_db_instance_instance_class    = var.aws_db_instance_instance_class
  rds_access                        = var.rds_access

  vpc_id              = module.vpc.vpc_id
  private_subnets_ids = [module.vpc.first_private_subnet_id, module.vpc.second_private_subnet_id]

}

module "messaging" {
  source = "./messaging"

  sqs_queue_name = var.sqs_queue_name
  sns_topic_name = var.sns_topic_name
  user_email     = var.user_email
}