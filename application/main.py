from datetime import datetime, timezone

from fastapi import FastAPI

app = FastAPI(
    title="SecureKube Transaction Service",
    description="A reference banking transaction service for DevSecOps demonstration.",
    version="1.0.0",
)


@app.get("/")
def root():
    return {
        "service": "SecureKube Transaction Service",
        "status": "running",
    }


@app.get("/health")
def health():
    return {
        "status": "healthy",
        "timestamp": datetime.now(timezone.utc).isoformat(),
    }


@app.get("/api/v1/status")
def status():
    return {
        "service": "transaction-service",
        "version": "1.0.0",
        "environment": "development",
    }


@app.get("/api/v1/transactions/{transaction_id}")
def get_transaction(transaction_id: str):
    return {
        "transaction_id": transaction_id,
        "status": "processed",
        "message": "Transaction retrieved successfully",
    }