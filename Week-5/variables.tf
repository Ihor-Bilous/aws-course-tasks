variable "key_name" {
  type    = string
}

variable "account_number" {
  type    = string
}

variable "image_id" {
  type    = string
  default = "ami-013a129d325529d4d"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "user_email" {
  type    = string
  default = "ihorkobilous@gmail.com"
}
