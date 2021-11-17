output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "first_public_subnet_id" {
  value = aws_subnet.first_public_subnet.id
}

output "second_public_subnet_id" {
  value = aws_subnet.second_public_subnet.id
}

output "first_private_subnet_id" {
  value = aws_subnet.first_private_subnet.id
}

output "second_private_subnet_id" {
  value = aws_subnet.second_private_subnet.id
}