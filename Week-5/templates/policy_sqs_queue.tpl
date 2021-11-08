{
  "Id": "Policy1636400620678",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Stmt1636399737237",
      "Action": "sqs:*",
      "Effect": "Allow",
      "Resource": "arn:aws:sqs:us-west-2:${account_number}:${sqs_queue_name}",
      "Principal": "*"
    }
  ]
}