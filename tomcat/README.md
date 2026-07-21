# DockerProject Tomcat

This project builds a Docker image with Apache Tomcat 10.1.54 and deploys a JSP web application backed by a MariaDB database.

## Files
- Dockerfile: defines the container image and deploys the Java app
- index.html: the homepage served by Tomcat
- loginapp/: contains the JSP-based Java web app
- docker-compose.yml: starts Tomcat together with MariaDB
- init.sql: creates the database table for stored credentials

## Build and run with Docker Compose

```bash
cd DockerProject/tomcat
docker compose up --build
```

Open http://localhost:8080/loginapp to store a credential and view stored user IDs.

## App behavior

1. Enter a username and password on the main page.
2. The app stores the credential in MariaDB.
3. Duplicate usernames are rejected.
4. A separate page shows all stored user IDs and usernames.

## Useful commands

```bash
docker compose down
docker compose logs -f web
docker compose ps
```
