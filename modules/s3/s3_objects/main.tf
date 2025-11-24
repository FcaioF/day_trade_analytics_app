# Pastas de trabalho do S3

# python_scripts
resource "aws_s3_object" "python_scripts" {
  for_each = fileset("${var.app_bucket}/", "**")
  bucket = var.name_bucket
  key    = "app/${each.value}"
  source = "${var.app_bucket}/${each.value}"
  etag   = filemd5("${var.app_bucket}/${each.value}")
}

# bash_scripts
resource "aws_s3_object" "bash_scripts" {
  for_each = fileset("${var.files_bash}/", "**")
  bucket = var.name_bucket
  key    = "scripts/${each.value}"
  source = "${var.files_bash}/${each.value}"
  etag   = filemd5("${var.files_bash}/${each.value}")
}


