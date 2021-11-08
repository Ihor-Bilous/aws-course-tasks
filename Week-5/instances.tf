resource "aws_instance" "week5_instance" {
  ami                  = var.image_id
  instance_type        = var.instance_type
  key_name             = var.key_name
  iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.id
  vpc_security_group_ids = [
    aws_security_group.public_ssh_sg.id
  ]
  tags = {
    Name = "week5-instance"
  }
}
