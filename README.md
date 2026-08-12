# SecureKube

## DevSecOps Reference Implementation

SecureKube is a hands-on DevSecOps reference project demonstrating how
application security, container security, Kubernetes security,
Infrastructure as Code (IaC), Policy as Code, and CI/CD can be integrated
into a secure software delivery lifecycle.

## Problem Statement

Modern applications are deployed through increasingly complex cloud-native
infrastructure involving containers, Kubernetes, Infrastructure as Code,
and automated CI/CD pipelines.

Security issues can be introduced at any stage of this lifecycle.

SecureKube demonstrates how security controls can be shifted left and
integrated throughout the software delivery pipeline.

## Architecture

The project will progressively integrate:

- Application development
- Containerization using Docker
- Kubernetes deployment
- Kubernetes security controls
- Infrastructure as Code using Terraform
- Infrastructure security scanning
- Container vulnerability scanning
- Policy as Code
- CI/CD using Harness
- Google Cloud / GKE

## Technology Stack

| Area | Technology |
|---|---|
| Application | Python / FastAPI |
| Containerization | Docker |
| Orchestration | Kubernetes |
| IaC | Terraform |
| Cloud | Google Cloud Platform |
| Container Security | Trivy |
| IaC Security | Checkov |
| Policy as Code | OPA / Gatekeeper |
| CI/CD | Harness |
| Version Control | Git / GitHub |

## Project Status

### Phase 1 — Application & Containerization

- [ ] Build application
- [ ] Create Docker image
- [ ] Run container locally
- [ ] Push project to GitHub

### Phase 2 — Kubernetes

- [ ] Deploy application
- [ ] Configure Service
- [ ] Configure resource limits
- [ ] Configure health checks

### Phase 3 — Kubernetes Security

- [ ] RBAC
- [ ] SecurityContext
- [ ] NetworkPolicy
- [ ] Pod security controls

### Phase 4 — Infrastructure as Code

- [ ] Terraform configuration
- [ ] GCP infrastructure
- [ ] Infrastructure validation

### Phase 5 — DevSecOps

- [ ] Trivy
- [ ] Checkov
- [ ] OPA
- [ ] Gatekeeper
- [ ] Harness CI/CD

## Objective

The primary objective is to demonstrate a practical DevSecOps architecture
where security controls are integrated throughout the software delivery
lifecycle rather than being performed only after deployment.