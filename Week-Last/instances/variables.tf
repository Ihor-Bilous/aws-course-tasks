variable "key_name" {
  type = string
}

variable "bucket_name" {
  type = string
}

variable "rds_address" {
  type = string
}

variable "image_id" {
  type = string
}

variable "nat_image_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "vpc_cidr_block" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "public_subnets_ids" {
  type = list(string)
  validation {
    condition     = length(var.public_subnets_ids) == 2
    error_message = "Number of subnets ids must equal to 2."
  }
}

variable "private_subnet_id" {
  type = string
}