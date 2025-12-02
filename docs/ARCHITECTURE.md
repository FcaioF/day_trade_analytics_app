# Architecture Diagram & Flow

Below is an overview of how the components interact:

```
  User <---HTTP---> Streamlit UI (EC2 / Local)
             |
             +---> yfinance (Yahoo Finance) for real-time stock data
             |
             +---> AI Agents (Groq) for insights, searches
             |
             +---> S3 (storage) for app components & supporting files (deployed via Terraform)
             |
             +---> EC2 user_data downloads app & scripts, runs Streamlit
             |
             +---> Optional: Logs & metrics (CloudWatch), DB for historical storage
```

Notes:
- Streamlit exposes the UI on port 8501 (open in SG); the `user_data` script runs at boot.
- Terraform manages S3, IAM, EC2 and Security Group resources.
