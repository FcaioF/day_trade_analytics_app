# Configuração dos recursos IAM

# IAM Role para EC2 Instance Profile
resource "aws_iam_role" "iam_app_profile_role" {
  
  name = "iam_app_profile_role"

  managed_policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AmazonElasticMapReduceforEC2Role"
  ]

  assume_role_policy = <<EOF
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

# Profile
resource "aws_iam_instance_profile" "app_profile" {
  name = "app_profile"
  role = aws_iam_role.iam_app_profile_role.name
}
