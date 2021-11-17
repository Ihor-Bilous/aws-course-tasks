variable "availability_zones" {
  type = list(string)
  validation {
    condition     = length(var.availability_zones) == 4
    error_message = "Number of availability zones must equal to 4."
  }
}

variable "vpc_cidr_block" {
  type = string
}

variable "subnets_cidr_blocks" {
  type = list(string)
  validation {
    condition     = length(var.subnets_cidr_blocks) == 4
    error_message = "Number of cidr blocks must equal to 4."
  }
}

variable "nat_ec2_instance_id" {
  type = string
}