provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "ssh_security_group" {
    name        = "allow_ssh"
    description = "Allow SSH connection to instance"

    ingress = [
        {
            description      = "SSH"
            from_port        = 22
            to_port          = 22
            protocol         = "tcp"
            cidr_blocks      = ["0.0.0.0/0"]
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            security_groups  = []
            self             = false      
        }
    ]

    egress = [
        {
            description      = "SSH"
            from_port        = 0
            to_port          = 0
            protocol         = "-1"
            cidr_blocks      = ["0.0.0.0/0"]
            ipv6_cidr_blocks = ["::/0"]
            prefix_list_ids  = []
            security_groups  = []
            self             = false 
        }
    ]
}

resource "aws_security_group" "http_security_group" {
    name        = "allow_http"
    description = "Allow HTTP connection to instance"

    ingress = [
        {
            description      = "HTTP"
            from_port        = 80
            to_port          = 80
            protocol         = "tcp"
            cidr_blocks      = ["0.0.0.0/0"]
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            security_groups  = []
            self             = false      
        },
        {
            description      = "HTTPS"
            from_port        = 443
            to_port          = 443
            protocol         = "tcp"
            cidr_blocks      = ["0.0.0.0/0"]
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            security_groups  = []
            self             = false      
        }
    ]

    egress = [
        {
            description      = "HTTP"
            from_port        = 0
            to_port          = 0
            protocol         = "-1"
            cidr_blocks      = ["0.0.0.0/0"]
            ipv6_cidr_blocks = ["::/0"]
            prefix_list_ids  = []
            security_groups  = []
            self             = false 
        }
    ]
}

resource "aws_instance" "ec2_instance_week_2" {
    ami                    = var.image_id
    instance_type          = var.instance_type
    key_name               = var.key_name
    vpc_security_group_ids = [
        "${aws_security_group.http_security_group.id}",
        "${aws_security_group.ssh_security_group.id}"
    ]
    iam_instance_profile   = "${aws_iam_instance_profile.ec2_instance_profile.id}"
    user_data              = <<EOF
        #! /bin/bash
        sudo yum update
        aws s3 cp s3://${var.bucket_name}/${var.file_name} /home/ec2-user/${var.file_name}
    EOF
}
