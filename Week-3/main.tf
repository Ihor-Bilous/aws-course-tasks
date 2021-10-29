provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "ec2_instance_week_3" {
  ami           = var.image_id
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids = [
    aws_security_group.ec2_http_security_group.id,
    aws_security_group.ec2_ssh_security_group.id
  ]
  iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.id
  user_data            = data.template_file.ec2_user_data.rendered
}