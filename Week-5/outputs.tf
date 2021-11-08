output "sqs_queue_url" {
  value = aws_sqs_queue.sqs_queue.url
}

output "sns_topic_arn" {
  value = aws_sns_topic.sns_topic.arn
}

output "instance_ip" {
  value = aws_instance.week5_instance.public_ip
}