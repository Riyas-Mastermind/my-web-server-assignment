# Ubuntu Web Server Deployment with Docker & Git
# 🌐 Scalable Ubuntu-Nginx Web Architecture
> **Status:** Production Ready | **Version:** 1.1.0 | **Author:** Riyas-Mastermind

## 📝 Executive Summary
This project outlines a standardized approach to deploying web services using an Ubuntu-based containerized environment. By utilizing a declarative configuration model (Docker Compose), we ensure that the web server infrastructure is **immutable**, **reproducible**, and **portable**.

---

## 🏗️ System Architecture & Data Flow



The deployment follows a layered architecture:
1.  **Orchestration Layer:** Docker Compose manages the lifecycle.
2.  **Container Layer:** A hardened Ubuntu image running an Nginx process.
3.  **Application Layer:** A static HTML payload injected into the web root.
4.  **Network Layer:** A bridge network mapping high-level host ports to standard service ports.

### 🔌 Technical Specifications
| Component | Specification | Purpose |
| :--- | :--- | :--- |
| **Base OS** | Ubuntu 22.04 LTS | Security and stability |
| **Web Server** | Nginx Open Source | High-performance content delivery |
| **HTTP Port** | 80 (Internal) -> 8080 (External) | Standard web traffic |
| **HTTPS Port** | 443 (Internal) -> 443 (External) | Secure traffic readiness |
| **Storage** | Layered Image FS | Immutable deployment |

---

## 🛠️ Step-by-Step Technical Instructions

### I. Environment Initialization
Before deployment, verify your local Ubuntu environment:
```bash
# Verify Docker version
docker --version

# Ensure the Docker daemon is active
sudo systemctl status docker
