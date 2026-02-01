# 🌐 Enterprise Ubuntu-Nginx Containerized Infrastructure
> **Status:** Production Ready | **Version:** 2.0.0 | **Maintainer:** Riyas-Mastermind

## 📝 Executive Summary
This repository demonstrates a standardized approach to deploying high-performance web services using an **Ubuntu-based containerized environment**. By leveraging **Infrastructure as Code (IaC)** via Docker Compose, we ensure that the web server environment is **immutable**, **portable**, and **reproducible** across any Linux-based host.

---

## 🏗️ System Architecture & Data Flow

The deployment follows a **decoupled layered architecture**, separating the host operating system from the service runtime.

1.  **Orchestration Layer:** Docker Compose manages the service lifecycle and resource allocation.
2.  **Container Layer:** A hardened Ubuntu 22.04 LTS image running a background Nginx process.
3.  **Application Layer:** A modern, CSS3-styled "Glassmorphism" dashboard injected into the web root.
4.  **Network Layer:** A Docker Bridge Network providing isolation and port-forwarding.

### 🔌 Technical Specifications
| Component | Specification | Rationale |
| :--- | :--- | :--- |
| **Base OS** | Ubuntu 22.04 LTS | Enterprise-grade stability & security |
| **Web Server** | Nginx (Stable) | High-concurrency content delivery |
| **Orchestrator** | Docker Compose v3.8 | Declarative configuration management |
| **HTTP Ingress** | Port 8080 (Host) | Avoids conflicts with standard Port 80 |
| **Networking** | Default Bridge | Network isolation from host stack |

---

## 🌐 Networking & Port Logic

This project utilizes **Port Mapping** to bridge the gap between the isolated container and the external network.

> **Logic:** `HOST_PORT : CONTAINER_PORT`

* **8080 : 80** -> Directs external web requests from your browser to the internal Nginx engine.
* **443 : 443** -> Reserved for future SSL/TLS encrypted traffic.
* **Virtual IP:** Docker assigns an internal IP (typically `172.17.x.x`) accessible only to the host.

---

## 🚀 Deployment & Automation

### I. Environment Preparation
Ensure the Docker daemon is active and your user has the necessary permissions:
```bash
# Check Docker Status
sudo systemctl status docker

# Verify Git Configuration
git config --list

# Make the script executable (One-time setup)
chmod +x deploy.sh

# Launch the automated deployment
./deploy.sh

# Build and start in detached mode
sudo docker-compose up -d --build

# View real-time logs
sudo docker-compose logs -f

# Shutdown and remove containers
sudo docker-compose down
