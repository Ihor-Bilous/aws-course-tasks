resource "aws_sqs_queue" "sqs_queue" {
  name = "week5-sqs_queue"
}

resource "aws_sqs_queue_policy" "sqs_queue_policy" {
  queue_url  = aws_sqs_queue.sqs_queue.id
  policy     = data.template_file.sqs_policy.rendered
  depends_on = [aws_sqs_queue.sqs_queue]
}