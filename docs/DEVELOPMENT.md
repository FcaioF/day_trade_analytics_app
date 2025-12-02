# Development Guide

This document is aimed at contributors and reviewers who want to extend or maintain the repository.

## Setup local dev environment

1. Clone repo and create virtual env:

```powershell
git clone https://github.com/FcaioF/day_trade_analytics_app.git
cd day_trade_analytics_app
python -m venv .venv
.\.venv\Scripts\Activate.ps1
pip install -r iac\scripts\requirements.txt
```

2. Run Streamlit locally and iterate on UI and features:

```powershell
cd iac\app
streamlit run dsa_app.py
```

3. Code style and linting:
- Consider adding tools such as `black`, `ruff` and `pylint` to enforce consistent style.

## Contribution ideas
- Add unit tests for data fetching (mock `yfinance`) and UI callbacks.
- Replace the in-memory computations with a managed data pipeline (e.g. ETL -> S3 -> RDS).
- Add CI/CD with GitHub Actions to run tests, linting, and Terraform plan.

## Local Terraform testing
- We recommend running `terraform plan` and `terraform apply` in a dedicated non-production AWS account before adding new resources.

## Notes for extending AI integration
- The current code uses a `phi.agent` wrapper with `Groq` as a model. If you intend to add other LLM providers, abstract the model code and add configurable provider selection (via env var or config file).
