resource "aws_sns_topic" "sns_topic" {
  name = "wee4-sns-topic"
}

resource "aws_sns_topic_policy" "sns_topic_policy" {
  arn        = aws_sns_topic.sns_topic.arn
  policy     = data.template_file.sns_policy.rendered
  depends_on = [aws_sns_topic.sns_topic]
}

resource "aws_sns_topic_subscription" "sns_topic_subscription" {
  topic_arn  = aws_sns_topic.sns_topic.arn
  protocol   = "email"
  endpoint   = var.user_email
  depends_on = [aws_sns_topic.sns_topic]
}