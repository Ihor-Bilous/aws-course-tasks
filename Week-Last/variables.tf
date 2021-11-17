variable "key_name" {
  type    = string
  default = "ibilous-lohika-us-west-2"
}

variable "bucket_name" {
  type = string
}

variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "subnets_cidr_blocks" {
  type        = list(string)
  description = "CIDR blocks"
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24"]
  validation {
    condition     = length(var.subnets_cidr_blocks) == 4
    error_message = "Number of cidr blocks must equal to 4."
  }
}

variable "availability_zones" {
  type        = list(string)
  description = "Availability Zones"
  default     = ["us-west-2a", "us-west-2b", "us-west-2a", "us-west-2c"]
  validation {
    condition     = length(var.availability_zones) == 4
    error_message = "Number of availability zones must equal to 4."
  }
}

variable "image_id" {
  type    = string
  default = "ami-013a129d325529d4d"
}

variable "nat_image_id" {
  type    = string
  default = "ami-0032ea5ae08aa27a2"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "dynamodb_table_name" {
  type = string
}

variable "aws_db_instance_allocated_storage" {
  type    = number
  default = 20
}

variable "aws_db_instance_instance_class" {
  type    = string
  default = "db.t2.micro"
}

variable "rds_access" {
  type = object({
    name      = string
    user_name = string
    password  = string
  })
}

variable "sns_topic_name" {
  type = string
}

variable "sqs_queue_name" {
  type = string
}

variable "user_email" {
  type = string
}