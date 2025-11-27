# Projeto 2 - Deploy do Stack de Treinamento Distribuído de Machine Learning com PySpark no Amazon EMR
# Script Principal

# Módulo de Armazenamento
module "s3" {
  source            = "./modules/s3"
  name_bucket       = var.name_bucket
  versioning_bucket = var.versioning_bucket
  app_bucket        = var.app_bucket
  files_bash        = var.files_bash
}

# Módulo de Segurança
module "iam" {
  source = "./modules/iam"
  name_bucket = var.name_bucket
}

module "sg_permite_http" {

  source = "./modules/security-group"

}

module "dsa_ec2_instances" {
  source = "./modules/ec2-instances"
  ami_id         = "ami-025ca978d4c1d9825"
  instance_type  = "t2.micro"
  instance_profile = module.iam.ec2_s3_reader_profile_name
  vpc_security_group_ids = [module.sg_permite_http.security_group_id]
  user_data        = <<-EOF
                    #!/bin/bash           
                    aws s3 cp s3://${var.name_bucket}/scripts/ /tmp/scripts/ --recursive
                    chmod -R +x /tmp/scripts/
                    
                    aws s3 cp s3://${var.name_bucket}/app/ /tmp/app/ --recursive
                    chmod -R +x /tmp/app/

                    /tmp/scripts/bash_file.sh
EOF

}




