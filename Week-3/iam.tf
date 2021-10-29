resource "aws_iam_role" "ec2_instance_role" {
  name               = "ec2_instance_role"
  assume_role_policy = file("templates/role_ec2.json")
}

resource "aws_iam_role_policy" "ec2_s3_iam_role_policy" {
  name   = "ec2_s3_iam_role_policy"
  role   = aws_iam_role.ec2_instance_role.id
  policy = data.template_file.role_s3_policy.rendered
}

resource "aws_iam_role_policy" "ec2_dynamodb_iam_role_policy" {
  name   = "ec2_dynamodb_iam_role_policy"
  role   = aws_iam_role.ec2_instance_role.id
  policy = data.template_file.role_dynamodb_policy.rendered
}

resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "ec2_instance_profile"
  role = aws_iam_role.ec2_instance_role.name
}