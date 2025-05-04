# **Docker Learning Journey** 🚀

This folder documents my step-by-step hands-on learning of Docker from an absolute beginner level. Each scenario builds on the previous one to gradually introduce real-world container concepts.

---

## ✅ Scenarios Completed

### 1. Serve a Static HTML Page using Nginx
- **Description**: Created a Dockerfile using the official Nginx image to serve a static `index.html`.
- **Tools Used**: Nginx, Dockerfile, HTML
- **Location**: `Docker/HTML_Static/`

### 2. Run a Node.js App inside a Container
- **Description**: Containerized a simple Node.js app using the official `node:alpine` image.
- **Tools Used**: Node.js, Dockerfile, npm
- **Location**: `Docker/node-app/`

### 3. Use Environment Variables with Docker
- **Description**: Modified the Node.js app to accept environment variables using Docker CLI and `docker-compose`.
- **Tools Used**: Node.js, Environment Variables, Docker Compose
- **Location**: `Docker/node-app/`

### 4. Persist Data using Named Volumes
- **Description**: Created a Node.js counter app that stores data in a local file inside a named Docker volume.
- **Tools Used**: Node.js, Docker Compose, Named Volumes
- **Location**: `Docker/node-volume-counter/`

### 5. Multi-Container App with MongoDB
- **Description**: Built a Node.js app that connects to MongoDB in a separate container. Used Docker Compose for orchestration.
- **Tools Used**: Node.js, MongoDB, Docker Compose
- **Location**: `Docker/node-mongo-counter/`

### 6. Bind Mounts with Live Code Reload
- **Description**: Used bind mounts to sync code changes between the host and container in real-time. Integrated `nodemon` for automatic reload on changes.
- **Tools Used**: Docker Compose, Bind Mounts, Nodemon
- **Location**: `Docker/node-app/`
  

## 📁 Folder Structure

```
.
├── HTML_Static
│   ├── Dockerfile
│   └── index.html
├── README.md
├── node-app
│   ├── Dockerfile
│   ├── app.js
│   ├── app_bkp.js
│   ├── docker-compose.yml
│   ├── package-lock.json
│   ├── package.json
│   └── package_bkp.json
├── node-mongo-counter
│   ├── Dockerfile
│   ├── app.js
│   ├── docker-compose.yml
│   ├── package-lock.json
│   └── package.json
└── node-persist
    ├── Dockerfile
    ├── app.js
    ├── docker-compose.yml
    └── package.json

```


---

## 🚧 Coming Up Next
=======
- Docker Compose v3
- Docker networks
- Docker Hub + CI/CD integration
- Dockerfile optimizations (multi-stage builds)

---

## 🧠 Goal
To build a strong DevOps foundation and document my hands-on learning in a way that helps others and demonstrates my growth.

