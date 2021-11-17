variable "aws_db_instance_allocated_storage" {
  type = number
}

variable "aws_db_instance_instance_class" {
  type = string
}

variable "rds_access" {
  type = object({
    name      = string
    user_name = string
    password  = string
  })
}

variable "vpc_id" {
  type = string
}

variable "private_subnets_ids" {
  type = list(string)
  validation {
    condition     = length(var.private_subnets_ids) == 2
    error_message = "Number of subnets ids must equal to 2."
  }
}