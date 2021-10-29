data "template_file" "ec2_user_data" {
  template = file("templates/ec2_user_data.tpl")
  vars = {
    bucket_name = var.bucket_name
  }
}

data "template_file" "role_s3_policy" {
  template = file("templates/policy_ec2_s3_bucket.tpl")
  vars = {
    bucket_name = var.bucket_name
  }
}

data "template_file" "role_dynamodb_policy" {
  template = file("templates/policy_ec2_dynamodb.tpl")
  vars = {
    dynamodb_arn = aws_dynamodb_table.week-third-dynamodb-table.arn
  }
}
