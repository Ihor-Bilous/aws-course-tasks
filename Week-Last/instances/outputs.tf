output "nat_instance_id" {
  value = aws_instance.nat_instance.id
}

output "private_ec2_private_ip" {
  value = aws_instance.private_ec2_instance.private_ip
}

output "load_balancer_dns_name" {
  value = aws_lb.load_balancer.dns_name
}