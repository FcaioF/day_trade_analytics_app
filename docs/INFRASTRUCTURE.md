# Infrastructure Overview (Terraform)

This project includes Terraform code inside the `iac/` folder to provision resources on AWS.

## Modules
- `iac/modules/s3`: Creates an S3 bucket and uploads objects from `iac/app` and `iac/scripts`.
- `iac/modules/iam`: Creates an IAM Role and Instance Profile that allows EC2 to access the S3 bucket.
- `iac/modules/ec2-instances`: Creates one EC2 instance that runs a `user_data` script to fetch scripts and app from S3 and execute the Streamlit app.
- `iac/modules/security-group`: Creates a security group allowing incoming 80 (HTTP), 8501 (Streamlit), and 22 (SSH) traffic.

## Key Files
- `iac/main.tf`: Orchestrates modules and composes the `user_data` script to bootstrap the EC2 instance.
- `iac/variables.tf`: Holds variables that are required for the infrastructure deployment including `name_bucket`, `versioning_bucket`, `groq_api_key`.
- `iac/scripts/*`: Scripts used by EC2 to configure the instance and run Streamlit.

## Important Settings
- `name_bucket`: The name of the S3 bucket. Use a globally unique name.
- `groq_api_key`: Secret key that the app uses to connect to Groq; be careful when storing this in `terraform.tfvars` or leaving on Git history; prefer environment variables or secret manager solutions.
- `vpc_security_group_ids` in the EC2 module: The default implementation uses the security group module output value.

## Example Terraform Flow

1. Ensure your AWS credentials are set:

```powershell
# Windows
setx AWS_ACCESS_KEY_ID "YOUR_KEY"
setx AWS_SECRET_ACCESS_KEY "YOUR_SECRET"
```

2. Initialize and apply Terraform:

```powershell
cd iac
terraform init
terraform plan -var "name_bucket=yourdsa-bucket-unique" -var "groq_api_key=YOUR_GROQ_KEY"
terraform apply -var "name_bucket=yourdsa-bucket-unique" -var "groq_api_key=YOUR_GROQ_KEY"
```

3. Once the EC2 is created, connect via SSH or visit the public IP using port 8501 for Streamlit UI.

## Security & Best Practices
- Do not store secret values (like the Groq API key) in plain text in version control. Use secrets (AWS Secrets Manager) or CI/CD secret injection.
- Consider using IAM policies with the minimum privileges required and enabling S3 bucket policies.
- For production, prefer a platform-native or more scalable deployment such as ECS with a load balancer, or using IAM roles for service accounts if using EKS.
