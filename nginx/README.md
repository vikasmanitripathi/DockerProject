# DockerProject

This project builds a lightweight Docker image with Nginx installed and serves a simple homepage.

## Files
- Dockerfile: defines the container image
- index.html: the homepage served by Nginx
- docker-compose.yml: optional way to run the container

## Build and run with Docker

```bash
cd DockerProject
docker build -t dockerproject-nginx .
docker run -d -p 8080:80 --name dockerproject-nginx dockerproject-nginx
```

Open http://localhost:8080 to view the page.

## Run with Docker Compose

```bash
cd DockerProject
docker compose up --build
```

To stop it:

```bash
docker compose down
```

## Useful commands

```bash
docker ps
docker stop dockerproject-nginx
docker rm dockerproject-nginx
docker images
```
