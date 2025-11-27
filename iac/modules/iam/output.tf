# Output do IAM

output "ec2_s3_reader_profile_name" {
  description = "O nome do Instance Profile para anexar à EC2."
  value       = aws_iam_instance_profile.s3_reader_profile.name
}