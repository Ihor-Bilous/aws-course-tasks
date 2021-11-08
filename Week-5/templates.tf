data "template_file" "sqs_policy" {
  template = file("templates/policy_sqs_queue.tpl")
  vars = {
    account_number = var.account_number
    sqs_queue_name = aws_sqs_queue.sqs_queue.name
  }
}

data "template_file" "sns_policy" {
  template = file("templates/policy_sns_topic.tpl")
  vars = {
    account_number = var.account_number
    sns_topic_name = aws_sns_topic.sns_topic.name
  }
}