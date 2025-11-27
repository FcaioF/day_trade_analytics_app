# Configuração dos recursos IAM

# IAM Role para EC2 Instance Profile
resource "aws_iam_policy" "s3_read_access_policy" {
  name        = "s3-read-access-policy-${var.name_bucket}"
  description = "Permite que a EC2 leia o bucket S3 de dados."
  
  # ... (conteúdo da policy, omitido por brevidade) ...
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

# 1. Cria a Role IAM para a EC2
resource "aws_iam_role" "ec2_s3_reader_role" {
  name = "ec2-s3-reader-role"

  # Política de Confiança: Permite que o serviço EC2 assuma esta Role
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowEC2ToAssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# 2. Anexa a Política de S3 à Role
resource "aws_iam_role_policy_attachment" "s3_read_attach" {
  # Anexa a política à Role recém-criada
  role       = aws_iam_role.ec2_s3_reader_role.name 
  policy_arn = aws_iam_policy.s3_read_access_policy.arn
}

# 3. Cria o Instance Profile
resource "aws_iam_instance_profile" "s3_reader_profile" {
  name = "s3-reader-profile"
  # Associa a Role ao Instance Profile
  role = aws_iam_role.ec2_s3_reader_role.name
}