# DockerProject Tomcat

This project builds a Docker image with Apache Tomcat 10.1.54 and deploys a simple Java web application.

## Files
- Dockerfile: defines the container image and deploys the Java app
- index.html: the homepage served by Tomcat
- loginapp/: contains the JSP-based Java web app
- docker-compose.yml: optional way to run the container

## Build and run with Docker

```bash
cd DockerProject/tomcat
docker build -t dockerproject-tomcat .
docker run -d -p 8080:8080 --name dockerproject-tomcat dockerproject-tomcat
```

Open http://localhost:8080 to view the default Tomcat page, or visit http://localhost:8080/loginapp to use the Java application.

## Run with Docker Compose

```bash
cd DockerProject/tomcat
docker compose up --build
```

To stop it:

```bash
docker compose down
```

## Java app instructions

The Java app is a simple login demo built with JSP pages.

1. Open http://localhost:8080/loginapp
2. Use the following credentials:
   - Username: admin
   - Password: admin
3. After submitting the form, the app will show a success message if the credentials are correct.

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
