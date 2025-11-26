# Output do IAM

output "app_profile" {
  value = aws_iam_instance_profile.app_profile.arn
}