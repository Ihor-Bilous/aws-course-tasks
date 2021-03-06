resource "aws_sqs_queue" "sqs_queue" {
  name = var.sqs_queue_name
}

resource "aws_sns_topic" "sns_topic" {
  name = var.sns_topic_name
}

resource "aws_sns_topic_subscription" "sns_topic_subscription" {
  topic_arn  = aws_sns_topic.sns_topic.arn
  protocol   = "email"
  endpoint   = var.user_email
  depends_on = [aws_sns_topic.sns_topic]
}