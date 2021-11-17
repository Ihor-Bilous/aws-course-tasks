output "rds_endpoint" {
  value = module.rds.rds_endpoint
}

output "dynamodb_table_name" {
  value = module.dynamodb.dynamodb_table_name
}

output "sns_topic_arn" {
  value = module.messaging.sns_topic_arn
}

output "sqs_queue_url" {
  value = module.messaging.sqs_queue_url
}

output "private_ec2_private_ip" {
  value = module.instances.private_ec2_private_ip
}

output "load_balancer_dns_name" {
  value = module.instances.load_balancer_dns_name
}