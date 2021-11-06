variable "key_name" {
  type    = string
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

variable "availability_zones" {
  type        = list(string)
  description = "Availability Zones"
  default     = ["us-west-2a", "us-west-2b"]
  validation {
    condition     = length(var.availability_zones) == 2
    error_message = "Number of availability zones must equal to 2."
  }
}
