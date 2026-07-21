# DockerProject Tomcat

This project builds a Docker image with Apache Tomcat 10.1.54 installed and serves a simple homepage.

## Files
- Dockerfile: defines the container image
- index.html: the homepage served by Tomcat
- docker-compose.yml: optional way to run the container

## Build and run with Docker

```bash
cd DockerProject/tomcat
docker build -t dockerproject-tomcat .
docker run -d -p 8080:8080 --name dockerproject-tomcat dockerproject-tomcat
```

Open http://localhost:8080 to view the page.

## Run with Docker Compose

```bash
cd DockerProject/tomcat
docker compose up --build
```

To stop it:

```bash
docker compose down
```

## Inspect the running container

```bash
docker exec -it dockerproject-tomcat /bin/bash
```

Inside the container, you can check the installation with:

```bash
java -version
ls /usr/local/tomcat
./version.sh
```

## Useful commands

```bash
docker ps
docker stop dockerproject-tomcat
docker rm dockerproject-tomcat
docker images
```
