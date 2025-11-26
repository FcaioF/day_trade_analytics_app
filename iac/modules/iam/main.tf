# Configuração dos recursos IAM

# IAM Role para EC2 Instance Profile
resource "aws_iam_policy" "s3_read_access_policy" {
  name        = "s3-read-access-policy-${var.name_bucket}"
  description = "Permite que a EC2 leia o bucket S3 de dados."

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:GetObject",
          "s3:ListBucket",
          "s3:GetBucketLocation",
          "s3:GetObjectVersion"
        ]
        Effect   = "Allow"
        Resource = [
          "arn:aws:s3:::${var.name_bucket}",
          "arn:aws:s3:::${var.name_bucket}/*"
        ]
      },
    ]
  })
}

# 4. Anexa a Política de S3 à Role da EC2
resource "aws_iam_role_policy_attachment" "app_profile" {
  role       = aws_iam_role.iam_app_profile_role.name
  policy_arn = aws_iam_policy.s3_read_access_policy.arn
}