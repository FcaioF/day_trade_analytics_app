# Output do IAM

output "instance_profile" {
  value = aws_iam_instance_profile.app_profile.arn
}