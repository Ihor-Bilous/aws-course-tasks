resource "aws_iam_role" "ec2_instance_role" {
  name               = "ec2_instance_role"
  assume_role_policy = file("instances/templates/role_ec2.json")
}

resource "aws_iam_role_policy" "ec2_iam_role_policy" {
  name   = "ec2_s3_iam_role_policy"
  role   = aws_iam_role.ec2_instance_role.id
  policy = file("instances/templates/policy_ec2.json")
}

resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "ec2_instance_profile"
  role = aws_iam_role.ec2_instance_role.name
}