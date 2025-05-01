i# Docker Learning Journey 🚀

This folder documents my step-by-step hands-on learning of Docker from an absolute beginner level. Each scenario builds on the previous one to gradually introduce real-world container concepts.

---

## ✅ Scenarios Completed

### 1. Serve a Static HTML Page using Nginx
- **Description**: Created a Dockerfile using the official Nginx image to serve a static `index.html`.
- **Tools Used**: Nginx, Dockerfile, HTML
- **Location**: `DockerFiles/HTML_Static/`

### 2. Run a Node.js App inside a Container
- **Description**: Containerized a simple Node.js app using the official `node:alpine` image.
- **Tools Used**: Node.js, Dockerfile, npm
- **Location**: `DockerFiles/node-app/`

### 3. Use Environment Variables with Docker
- **Description**: Modified the Node.js app to accept environment variables using Docker CLI and `docker-compose`.
- **Tools Used**: Node.js, Environment Variables, Docker Compose
- **Location**: `DockerFiles/node-app/`

### 4. Bind Mounts with Live Code Reload
- **Description**: Used bind mounts to sync code changes between the host and container in real-time. Integrated `nodemon` for automatic reload on changes.
- **Tools Used**: Docker Compose, Bind Mounts, Nodemon
- **Location**: `DockerFiles/node-app/`
  
---

## 📁 Folder Structur

```
.
├── HTML_Static
│   ├── Dockerfile
│   └── index.html
├── README.md
└── node-app
    ├── Dockerfile
    ├── app.js
    ├── app_bkp.js
    ├── docker-compose.yml
    ├── package-lock.json
    ├── package.json
    └── package_bkp.json
```


---

## 🚧 Coming Up Next
- Volumes & Bind Mounts
- Multi-container apps
- Docker Compose v3
- Docker networks
- Docker Hub + CI/CD integration

---

## 🧠 Goal
To build a strong DevOps foundation and document my hands-on learning in a way that helps others and demonstrates my growth.

