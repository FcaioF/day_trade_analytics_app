Day Trade Analytics App

Português (BR): veja `README-BR.md` para a versão em Português.

A sample project that demonstrates a real-time day trade analytics web application built with Streamlit, Plotly, and multiple AI agents integrated through Groq. The project includes Terraform infrastructure-as-code modules to deploy an EC2 instance and S3 storage on AWS, plus a Dockerfile and scripts to run locally and inside containers.

This repository is a portfolio-ready project aimed at showcasing a full-stack data analytics deployment with automated infra provisioning.

---

## 🚀 Highlights
- Real-time stock analytics app using Yahoo Finance (`yfinance`) and interactive visualizations (`plotly`, `streamlit`).
- AI agents and tools integration (Groq, DuckDuckGo, YFinance tools) for insights and web search augmentation.
- Infrastructure-as-code (Terraform) modules for S3, IAM, EC2, and Security Group provisioning.
- Containerized environment using `Dockerfile` with Terraform and AWS CLI pre-installed for portability.

---

## Table of Contents
1. [Demo / Screenshots](#-demo--screenshots)
2. [Technology Stack](#-technology-stack)
3. [Architecture](#-architecture)
4. [Local Run (Developer)](#-local-run-developer)
5. [Docker Run](#-docker-run)
6. [Deploy to AWS (Terraform)](#-deploy-to-aws-terraform)
7. [Project Structure](#-project-structure)
8. [Key Files & Modules](#-key-files--modules)
9. [What's Included / Features](#-whats-included--features)
10. [Future Improvements & Roadmap](#-future-improvements--roadmap)
11. [About / Contact](#-about--contact)

---

## 📺 Demo / Screenshots
Add your screenshots or GIFs here so visitors see the UI and graphs. For example, add a screenshot of Streamlit UI with candlestick charts and mobile/desktop views.

---

## 🧭 Technology Stack
- Python 3.11+ (Streamlit app)
- Streamlit (application UI)
- Plotly (interactive visualizations)
- yfinance (stock historic data)
- Groq (AI model integration)
- Terraform (infrastructure as code)
- AWS (S3, EC2, IAM)
- Docker (containerized execution)

---

## 🏗 Architecture
The app workflow:
- The Streamlit app in `iac/app/dsa_app.py` fetches stock data using `yfinance` and renders charts with Plotly.
- AI agents are implemented via the `phi.agent` helper with `Groq` model integration for insights.
- Data & scripts are packaged and uploaded to S3 via Terraform in `iac/modules/s3`.
- EC2 instances are provisioned via `iac/modules/ec2-instances` with an IAM instance profile attached for S3 access.
- A startup `user_data` script downloads files from S3 and runs the Streamlit app.

---

## 🧪 Local Run (Developer)
These steps are for local development (without AWS):

1. Install dependencies into a virtual environment:

```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
pip install --upgrade pip
pip install -r iac\scripts\requirements.txt
```

2. Run the Streamlit app locally:

```powershell
cd iac\app
streamlit run dsa_app.py
```

3. Open the browser to http://localhost:8501 and use the UI by entering a stock ticker (e.g., MSFT, TSLA).

---

## 🐳 Docker Run
Build and run the provided Docker image with Terraform and the AWS CLI pre-installed. This is useful for consistent development environments or for running Terraform where Python & other dependencies aren't configured locally.

```powershell
# Build the image
cd .
# from the repo root
docker build -t dsa-terraform-image:latest .

# Run the container and mount the iac folder into /iac
# On Windows, replace the volume path with the absolute path if needed.

docker run -dit --name dsa-p1 -v ${PWD}:/iac dsa-terraform-image:latest /bin/bash
```

Once inside the container, you can run `terraform` and `aws` commands.

---

## 🔧 Deploy to AWS (Terraform)
This repo includes a working Terraform configuration that creates:
- S3 bucket (with versioning & objects upload)
- IAM policy, role and instance profile for an EC2 instance to access S3
- Security Group (allow 80, 8501, 22)
- EC2 instance that downloads code from S3 and runs the Streamlit app

Before applying Terraform, make sure to have AWS credentials available (either via environment or `~/.aws/credentials`).

Basic commands (from `iac` folder):

```powershell
cd iac
terraform init
terraform plan -var "name_bucket=your-unique-bucket-name" -var "groq_api_key=YOUR_GROQ_KEY"
terraform apply -var "name_bucket=your-unique-bucket-name" -var "groq_api_key=YOUR_GROQ_KEY" -auto-approve
```

Notes:
- The app uses `Groq` and needs the API key set as a Terraform variable which is then exported on the EC2 `user_data` script.
- The S3 module will upload all files in `iac/app` and `iac/scripts` into the bucket so the EC2 can fetch them.
- `security-group` allows port 8501 which is used by Streamlit.

---

## 📁 Project Structure
```
./
├─ Dockerfile
├─ LEIAME.txt (Portuguese instructions)
├─ iac/
│  ├─ app/dsa_app.py
│  ├─ scripts/bash_file.sh
│  ├─ scripts/requirements.txt
│  ├─ main.tf
│  ├─ variables.tf
│  └─ modules/
│     ├─ s3/
│     ├─ iam/
│     ├─ ec2-instances/
│     └─ security-group/
```

---

## 📂 Key Files & Modules
- `iac/app/dsa_app.py` — Application source code (Streamlit). Reads stock data, uses AI agents for insights and renders Plotly charts.
- `iac/scripts/bash_file.sh` — Script that configures environment and runs the Streamlit app on EC2.
- `iac/modules/s3` — Creates bucket and uploads app & script files.
- `iac/modules/iam` — IAM role/policy for EC2 to access S3.
- `iac/modules/ec2-instances` — EC2 instance resource using AMI & instance profile.
- `Dockerfile` — Container with Terraform and AWS CLI pre-installed.

---

## 🔮 Features & What I Built
- Interactive Streamlit app for tracking stocks and viewing candlestick charts.
- Agent-based AI augmentation using Groq + tools for fetching news and financial insights.
- End-to-end provisioning with Terraform to automate deployment to AWS.

---

## 📈 Future Improvements & Roadmap
- Add automated unit tests for UI & data fetching.
- Add GitHub Actions CI/CD to build Docker images and run Terraform plan with checks.
- Implement HTTPS, load balancer, and autoscaling for EC2 (or switch to ECS/EKS).
- Improve data caching and historical analysis; store data in a database (e.g., RDS or DynamoDB).

---

## 👤 About / Contact
Built by FcaioF — Data Science & DevOps demo project. For questions, feature requests, or contributions, open an issue or send a message.

### Contributing
Contributions are welcome — see `CONTRIBUTING.md` for details on how to open a PR, run tests, and add code or documentation.

---

## License
See `LICENSE` for licensing details (MIT license included).
