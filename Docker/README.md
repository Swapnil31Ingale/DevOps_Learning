# **Docker Learning Journey** 🚀

This folder documents my step-by-step hands-on learning of Docker from an absolute beginner level. Each scenario builds on the previous one to gradually introduce real-world container concepts.

---
## 🛠️ Skills Practiced

- Docker CLI & Dockerfiles
- Docker Compose for orchestration
- Bind mounts & named volumes
- CI/CD with GitHub Actions
- Multi-stage builds for optimization

---
## 📚 Table of Contents

- [✅ Scenarios Completed](#-scenarios-completed)
- [📁 Folder Structure](#-folder-structure)
- [🧠 Goal](#-goal)

---
## ✅ Scenarios Completed

### 1. Serve a Static HTML Page using Nginx
- **Description**: Created a Dockerfile using the official Nginx image to serve a static `index.html`.
- **Tools Used**: `Nginx`, `Dockerfile`, `HTML`
- **Location**: [`Docker/HTML_Static/`](./HTML_Static/)

### 2. Run a Node.js App inside a Container
- **Description**: Containerized a simple Node.js app using the official `node:alpine` image.
- **Tools Used**: `Node.js`, `Dockerfile`, `npm`
- **Location**: [`Docker/node-app/`](./node-app/)

### 3. Use Environment Variables with Docker
- **Description**: Modified the Node.js app to accept environment variables using Docker CLI and `docker-compose`.
- **Tools Used**: `Node.js`, `Environment Variables`, `Docker Compose`
- **Location**: [`Docker/node-app/`](./node-app/)

### 4. Persist Data using Named Volumes
- **Description**: Created a Node.js counter app that stores data in a local file inside a named Docker volume.
- **Tools Used**: `Node.js`, `Docker Compose`, `Named Volumes`
- **Location**: [`Docker/node-volume-counter/`](./node-persist/)

### 5. Multi-Container App with MongoDB
- **Description**: Built a Node.js app that connects to MongoDB in a separate container. Used Docker Compose for orchestration.
- **Tools Used**: `Node.js`, `MongoDB`, `Docker Compose`
- **Location**: [`Docker/node-mongo-counter/`](./node-mongo-counter/)

### 6. Bind Mounts with Live Code Reload
- **Description**: Used bind mounts to sync code changes between the host and container in real-time. Integrated `nodemon` for automatic reload on changes.
- **Tools Used**: `Docker Compose`, `Bind Mounts`, `Nodemon`
- **Location**: [`Docker/node-app/`](./node-app/)
  
### 7. Multi-container Node.js + MongoDB App using Docker Compose
- **Description**: A small Node.js app connected to MongoDB using a multi-container setup via Docker Compose.
- **Tools Used**: `Node.js`, `MongoDB`, `Docker Compose`, `Custom Networks`, `Named Volumes`
- **Location**: [`Docker/node-mongo-app/`](./node-mongo-app/)

### 8. Docker Networking with Compose 🌐
- **Description**: A simulated 3-tier architecture using Docker Compose with custom user-defined networks to isolate communication between Web, API, and MongoDB services.
- **Tools Used**: `Node.js`, `MongoDB`, `Docker Compose`, `Custom Networks` 
- **Location**: [`Docker/docker-networking/`](./docker-networking/)

### 9. Docker Image CI 🚀
- **Description**: Automated CI pipeline to build and push a Docker image for a Node.js + MongoDB application to Docker Hub using GitHub Actions. The workflow triggers on changes to the `Docker/node-mongo-network/` directory.
- **Tools Used**: `GitHub Actions`, `Docker`, `Docker Hub`
- **Location**: [`.github/workflows/docker-publish.yml`](../.github/workflows/docker-publish.yml)

### 10. Dockerfile Optimizations (Multi-Stage Builds) 🧪
- **Description**: Optimizing a Node.js Docker image using multi-stage builds. The final image is cleaner and lighter by separating the build environment from the production runtime.
- **Tools Used**: `Node.js`, `Docker (multi-stage build)`, `Docker Compose`
- **Location**: [`Docker/node-mongo-multistage/`](./node-mongo-multistage/)

## 🚀  DevOps in Action
Implemented GitHub Actions to automatically build and push Docker images on commit to `main` branch.
📂  [`docker-publish.yml`](../.github/workflows/docker-publish.yml)

## 📁 Folder Structure

```
.
├── docker-networking
│   ├── api
│   │   ├── app.js
│   │   └── Dockerfile
│   ├── docker-compose.yml
│   └── web
│       ├── app.js
│       └── Dockerfile
├── HTML_Static
│   ├── Dockerfile
│   └── index.html
├── node-app
│   ├── app_bkp.js
│   ├── app.js
│   ├── docker-compose.yml
│   ├── Dockerfile
│   ├── package_bkp.json
│   ├── package.json
│   └── package-lock.json
├── node-mongo-counter
│   ├── app.js
│   ├── docker-compose.yml
│   ├── Dockerfile
│   ├── package.json
│   └── package-lock.json
├── node-mongo-multistage
│   ├── app.js
│   ├── Dockerfile
│   └── package.json
├── node-mongo-network
│   ├── app.js
│   ├── docker-compose.yml
│   ├── Dockerfile
│   └── package.json
├── node-persist
│   ├── app.js
│   ├── docker-compose.yml
│   ├── Dockerfile
│   └── package.json
└── README.md

```

---

## 🧠 Goal
To build a strong DevOps foundation and document my hands-on learning in a way that helps others and demonstrates my growth.

## 🔮 What's Next?

I'll continue expanding this repo with:
- 🧪 Kubernetes setups
- ⚙️  CI/CD pipelines
- 🏗️ Infrastructure as Code (Terraform, Ansible)
- 📈 Observability & Monitoring
