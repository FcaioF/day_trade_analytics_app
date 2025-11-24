
variable "ami_id" {
  description = "AMI ID para as instâncias EC2"
  type        = string
}

variable "instance_type" {
  description = "Tipo da instância EC2"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "ID do grupo de segurança"
  type        = list(string)
}

variable "user_data" {
  description = "script que sera executado ao provisionar a instancia ec2"
  type     = string
}