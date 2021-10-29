output "instance_ip" {
  value = aws_instance.ec2_instance_week_3.public_ip
}

output "rds_endpoint" {
  value = aws_db_instance.demo_db.endpoint
}

output "dynamo_db_table" {
  value = aws_dynamodb_table.week-third-dynamodb-table.name
}
