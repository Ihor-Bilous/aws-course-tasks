output "public_ec2_public_ip" {
  value = aws_instance.public_ec2_instance.public_ip
}

output "private_ec2_private_ip" {
  value = aws_instance.private_ec2_instance.private_ip
}

output "dynamo_db_table" {
  value = aws_lb.week4-lb.dns_name
}
