# Getting Started — Run the App Locally and in Docker

This guide helps you run the Streamlit app locally for development and use the Docker container to reproduce the same environment cross-platform.

## 1. Run locally (recommended for development)

Prerequisites:
- Python 3.11+
- Optional: `virtualenv` or `venv` for an isolated environment

Steps:

1. Create and activate a virtual environment (Windows PowerShell example):

```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
```

2. Install required packages:

```powershell
pip install --upgrade pip
pip install -r iac\scripts\requirements.txt
```

3. Run the Streamlit app:

```powershell
cd iac\app
streamlit run dsa_app.py
```

4. Visit http://localhost:8501 and enter a ticker (MSFT, TSLA, GOOG, etc.)

## 2. Run in Docker (recommended for reproducible environment)

Build the Docker image (from repo root):

```powershell
docker build -t dsa-terraform-image:latest .
```

Run a container that mounts `iac/` so you can run Terraform and view or debug files inside the container:

```powershell
docker run -dit --name dsa-p1 -v ${PWD}:/iac dsa-terraform-image:latest /bin/bash

# (Enter container)
docker exec -it dsa-p1 /bin/bash
```

Inside the container you can run Terraform and AWS CLI commands, or launch the Streamlit app.

## 3. Notes
- If you plan to test Terraform, ensure your AWS credentials are available inside the container or on host machine.
- If running the app in production, secure secrets properly, and use secure S3 policies and HTTPS.
