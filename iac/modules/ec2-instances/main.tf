
resource "aws_instance" "app_instance" {
    
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = var.vpc_security_group_ids
  iam_instance_profile   = var.instance_profile
  user_data              = var.user_data
}