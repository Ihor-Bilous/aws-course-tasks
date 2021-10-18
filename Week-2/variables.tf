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
  default = "ibilous-week2-bucket"
}

variable "file_name" {
  type    = string
  default = "ibilous-s3-text-file.txt"
}
