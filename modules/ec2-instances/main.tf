
resource "aws_instance" "dsa_instance" {
    
  count                  = var.instance_count
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = var.vpc_security_group_ids
  user_data = var.user_data
  tags = {
    Name = "lab3-t5-terraform-${count.index}"
  }
}