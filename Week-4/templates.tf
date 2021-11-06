data "template_file" "ec2_public_user_data" {
  template = file("templates/ec2_user_data.tpl")
  vars = {
    instance_name = "public"
  }
}

data "template_file" "ec2_private_user_data" {
  template = file("templates/ec2_user_data.tpl")
  vars = {
    instance_name = "private"
  }
}

