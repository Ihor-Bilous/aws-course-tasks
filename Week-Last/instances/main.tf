data "template_file" "public_ec2_user_data" {
  template = file("instances/templates/public_ec2_user_data.tpl")
  vars     = {
    bucket_name = var.bucket_name
  }
}

data "template_file" "private_ec2_user_data" {
  template = file("instances/templates/private_ec2_user_data.tpl")
  vars     = {
    bucket_name = var.bucket_name
    rds_address = var.rds_address
  }
}

resource "aws_launch_template" "public_ec2_template" {
  name                   = "public_ec2_template"
  instance_type          = var.instance_type
  image_id               = var.image_id
  key_name               = var.key_name
  user_data              = base64encode(data.template_file.public_ec2_user_data.rendered)
  vpc_security_group_ids = [aws_security_group.public_sg.id]

  iam_instance_profile {
    name = aws_iam_instance_profile.ec2_instance_profile.name
  }
}

resource "aws_autoscaling_group" "public_ec2_ag" {
  max_size            = 2
  min_size            = 2
  desired_capacity    = 2
  vpc_zone_identifier = [var.public_subnets_ids[0], var.public_subnets_ids[1]]
  target_group_arns   = [aws_lb_target_group.lb_target_group.arn]

  launch_template {
    id      = aws_launch_template.public_ec2_template.id
    version = "$Latest"
  }
}

resource "aws_instance" "private_ec2_instance" {
  ami                    = var.image_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.private_subnet_id
  vpc_security_group_ids = [aws_security_group.private_sg.id]
  user_data              = data.template_file.private_ec2_user_data.rendered
  iam_instance_profile   = aws_iam_instance_profile.ec2_instance_profile.id
  tags                   = {
    Name = "private-ec2-instance"
  }
}

resource "aws_instance" "nat_instance" {
  ami                    = var.nat_image_id
  instance_type          = var.instance_type
  subnet_id              = var.public_subnets_ids[0]
  vpc_security_group_ids = [aws_security_group.public_sg.id]
  source_dest_check      = false
  tags                   = {
    Name = "nat_instance"
  }
}