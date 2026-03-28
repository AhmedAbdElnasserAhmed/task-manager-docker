Task Manager — Dockerized Microservices Stack
4
Overview

Task Manager is a containerized web application built using a modern microservices architecture. The system demonstrates how multiple services can be orchestrated together using Docker Compose.

The application uses:

Nginx as a Load Balancer and Reverse Proxy
Flask for the application backend (running in multiple instances)
PostgreSQL as the primary database
Redis for caching and performance optimization

This project showcases best practices for DevOps workflows, container orchestration, and scalable web architecture.

Architecture

The system is composed of the following services:

Service	Description
Nginx	Acts as a reverse proxy and load balancer
Flask App (2 instances)	Backend API servers
PostgreSQL	Persistent relational database
Redis	In-memory cache for performance
Docker Compose	Service orchestration
Request Flow
User Request
     │
     ▼
   Nginx
     │
     ▼
Flask Containers (Load Balanced)
     │
     ├────────► Redis (Cache)
     │
     ▼
 PostgreSQL (Database)
Project Structure
task-manager/
│
├── flask_app.py          # Flask backend application
├── requirements.txt      # Python dependencies
├── init.sql              # Database initialization
│
├── conf/                 # Nginx configuration
│
├── ssl/                  # SSL certificate generation
│   └── generate_ssl.sh
│
├── static/               # Static resources
│
├── .env                  # Environment variables
├── .env.example          # Environment template
│
└── docker-compose.yml    # Docker stack configuration
Features
Dockerized multi-service architecture
Load balancing with Nginx
Scalable Flask backend
PostgreSQL persistent storage
Redis caching layer
SSL support for secure local development
Environment variable configuration
Production-style container networking
Prerequisites

Before running the project ensure you have installed:

Docker
Docker Compose
Git

Verify installation:

docker --version
docker compose version
Setup and Run
1️⃣ Clone the Repository
git clone https://github.com/YOUR_USERNAME/task-manager-docker.git

cd task-manager-docker
2️⃣ Generate SSL Certificates

Run the script inside the ssl directory:

cd ssl
bash generate_ssl.sh
cd ..
3️⃣ Start the Application

Build and run the containers:

docker compose up -d --build
4️⃣ Access the Application

Open your browser:

https://localhost
Container Overview

Check running containers:

docker ps

Stop the stack:

docker compose down
Learning Objectives

This project demonstrates practical knowledge of:

Containerization with Docker
Multi-service orchestration with Docker Compose
Reverse proxy configuration with Nginx
Microservice architecture patterns
Backend scaling with multiple containers
Secure local development using SSL
Future Improvements

Possible enhancements:

Add CI/CD pipeline (GitHub Actions)
Deploy to Kubernetes
Add monitoring (Prometheus + Grafana)
Implement JWT authentication
Add frontend (React or Flutter Web)
Author

Ahmed Abd Elnasser
Software Engineer — Backend & DevOps
