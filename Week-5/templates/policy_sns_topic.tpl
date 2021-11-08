{
  "Id": "Policy1636401651195",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Stmt1636401649908",
      "Action": [
        "SNS:GetTopicAttributes",
        "SNS:SetTopicAttributes",
        "SNS:AddPermission",
        "SNS:RemovePermission",
        "SNS:DeleteTopic",
        "SNS:Subscribe",
        "SNS:ListSubscriptionsByTopic",
        "SNS:Publish",
        "SNS:Receive"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:sns:us-west-2:${account_number}:${sns_topic_name}",
      "Principal": "*"
    }
  ]
}