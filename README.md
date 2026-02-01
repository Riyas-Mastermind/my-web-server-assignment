# 🌐 Enterprise Secure-Nginx Containerized Infrastructure
> **Status:** Production Ready | **Security:** SSL/TLS Enabled | **Maintainer:** Riyas-Mastermind

## 📝 Executive Summary
This repository demonstrates a standardized approach to deploying high-performance, secure web services using a **Hardened Alpine Linux containerized environment**. By leveraging **Infrastructure as Code (IaC)** and **Self-Signed SSL Certificates**, we ensure that the web server environment is **immutable**, **encrypted**, and **production-aligned**.

---

## 🏗️ System Architecture & Data Flow

The deployment follows a **decoupled layered architecture**, utilizing a "Least Privilege" OS footprint for maximum performance.



1.  **Orchestration Layer:** Docker Compose manages the service lifecycle and resource allocation.
2.  **Container Layer:** A hardened Alpine Linux image running a background Nginx process (optimized for < 15MB footprint).
3.  **Security Layer:** OpenSSL-generated RSA-2048 bit encryption for HTTPS traffic.
4.  **Application Layer:** A modern, CSS3-styled "Glassmorphism" dashboard dynamically branded via `sed` injection.

### 🔌 Technical Specifications
| Component | Specification | Rationale |
| :--- | :--- | :--- |
| **Base OS** | Alpine Linux (Latest) | Minimal attack surface & rapid scaling |
| **Web Server** | Nginx (Stable) | High-concurrency content delivery |
| **Security** | TLS 1.3 (Self-Signed) | Encrypted data-in-transit (Port 443) |
| **HTTP Ingress** | Port 8080 | Conflict avoidance for dev environments |
| **Automation** | Sed/Bash | Dynamic branding & CI/CD readiness |

---

## 🔐 Security & Networking Logic

This project utilizes **Dual-Port Mapping** and **SSL Handshaking** to bridge the isolated container to the external network securely.



> **Traffic Logic:** > * **HTTP:** `8080 : 80` -> Standard web requests.
> * **HTTPS:** `443 : 443` -> Encrypted secure traffic.

* **Virtual IP:** Docker assigns an internal IP (e.g., `172.20.x.x`) for inter-container communication.
* **SSL Certs:** RSA-2048 keys are generated locally and mounted into `/etc/ssl/` within the container.

---

## 🚀 Deployment & Automation

### 1. Environment Preparation
Ensure the Docker daemon is active and your user has the necessary permissions:
```bash
# Check Docker Status
sudo systemctl status docker

# Verify Git Configuration
git config --list
```

### 2. Security Key Generation
Before deployment, generate the unique SSL certificates for your host:
```bash
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout nginx-selfsigned.key -out nginx-selfsigned.crt \
-subj "/C=IN/ST=KA/L=BLR/O=Riyas-Mastermind/CN=localhost"
```

### 3. Automated Execution
To simplify the build process, a custom Bash script (deploy.sh) has been provided. It handles container cleanup, image rebuilding, and network IP detection.
```bash
# Make the script executable (One-time setup)
chmod +x deploy.sh

# Launch the automated deployment
./deploy.sh
```

### 4. Manual Lifecycle Management
If you prefer manual control, use the standard Docker Compose workflow:
```bash
# Build and start in detached mode
sudo docker-compose up -d --build

# View real-time logs
sudo docker-compose logs -f

# Shutdown and remove containers
sudo docker-compose down
```

### 5. Verification
Confirm the service is active and listening:
```bash
# Check if container is running
sudo docker ps

# Test the connection locally
curl -I http://localhost:8080
```
