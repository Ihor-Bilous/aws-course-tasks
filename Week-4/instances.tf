resource "aws_instance" "public_ec2_instance" {
  ami           = var.image_id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = aws_subnet.public-week4-subnet.id
  vpc_security_group_ids = [
    aws_security_group.public_http_sg.id,
    aws_security_group.public_ssh_sg.id
  ]
  user_data = data.template_file.ec2_public_user_data.rendered
  tags = {
    Name = "public-week4-instance"
  }
}

resource "aws_instance" "private_ec2_instance" {
  ami           = var.image_id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = aws_subnet.private-week4-subnet.id
  vpc_security_group_ids = [
    aws_security_group.private_http_sg.id,
    aws_security_group.private_ssh_sg.id
  ]
  user_data = data.template_file.ec2_private_user_data.rendered
  tags = {
    Name = "private-week4-instance"
  }
}

resource "aws_instance" "nat_instance" {
  ami                    = var.nat_image_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public-week4-subnet.id
  vpc_security_group_ids = [aws_security_group.public_http_sg.id]
  source_dest_check      = false
  tags = {
    Name = "nat_instance"
  }
}
