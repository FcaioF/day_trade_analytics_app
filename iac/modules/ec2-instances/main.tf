
resource "aws_instance" "app_instance" {
    
  count                  = var.instance_count
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = var.vpc_security_group_ids
  iam_instance_profile   = var.instance_profile
  aws_iam_role           = var.aws_iam_role
  user_data              = var.user_data
}