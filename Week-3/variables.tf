variable "key_name" {
  type = string
}

variable "image_id" {
  type    = string
  default = "ami-013a129d325529d4d"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "bucket_name" {
  type    = string
  default = "ibilous-week3-bucket"
}

variable "aws_db_instance_allocated_storage" {
  type    = number
  default = 20
}

variable "aws_db_instance_instance_class" {
  type    = string
  default = "db.t2.micro"
}

variable "aws_db_instance_username" {
  type = string
}

variable "aws_db_instance_password" {
  type = string
}