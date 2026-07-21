# DockerProject

This project builds a Docker image with Apache Tomcat 10.1.54 installed and serves a simple homepage.

## Files
- Dockerfile: defines the container image
- index.html: the homepage served by Tomcat
- docker-compose.yml: optional way to run the container

## Build and run with Docker

```bash
cd DockerProject/nginx
docker build -t dockerproject-tomcat .
docker run -d -p 8080:8080 --name dockerproject-tomcat dockerproject-tomcat
```

Open http://localhost:8080 to view the page.

## Run with Docker Compose

```bash
cd DockerProject/nginx
docker compose up --build
```

To stop it:

```bash
docker compose down
```

## Useful commands

```bash
docker ps
docker stop dockerproject-tomcat
docker rm dockerproject-tomcat
docker images
```
