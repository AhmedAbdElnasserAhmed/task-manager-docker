# Task Manager — Docker Stack

Full Docker stack using:

- Nginx (Load Balancer)
- Flask (2 instances)
- PostgreSQL
- Redis

## Run

Generate SSL:

cd ssl
bash generate_ssl.sh
cd ..

Start services:

docker compose up -d --build

Open:

https://localhost
