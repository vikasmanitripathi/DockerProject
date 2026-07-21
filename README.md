# DockerProject

This project demonstrates a polished Java web application running on Apache Tomcat with a MariaDB database for storing credentials.

## What the app does

The application presents a modern login-style form where users can submit a username and password. Credentials are stored in a MariaDB table, duplicate usernames are rejected, and a separate page displays the stored user IDs and usernames.

## Project structure

- tomcat/: contains the Tomcat-based Java/JSP application, Docker setup, and the generated WAR artifact
- tomcat/init.sql: creates the database table used by the app
- tomcat/docker-compose.yml: starts the app and the MariaDB service together
- tomcat/dist/loginapp.war: packaged web application artifact

## Prerequisites

Make sure Docker and Docker Compose are installed on your machine.

## Run the project

From the DockerProject folder, run:

```bash
cd tomcat
docker compose up --build
```

## Access the app

Once the containers are running:

- Main page: http://localhost:8080/loginapp
- Stored users page: http://localhost:8080/loginapp/users.jsp

## App behavior

1. Open the main page and enter a username and password.
2. The app stores the values in the MariaDB database.
3. If the username already exists, the app shows a duplicate warning and does not create a second entry.
4. The users page lists all stored user IDs and usernames.
5. The login page includes a more professional layout and illustration.

## Database details

The MariaDB service uses these values:

- Database: appdb
- User: appuser
- Password: supplied through the `MARIADB_PASSWORD` environment variable (default: `apppass`)
- Root password: supplied through the `MARIADB_ROOT_PASSWORD` environment variable (default: `rootpass`)

## Configure GitHub secrets

To use these values in GitHub Actions or another CI pipeline, add these repository secrets in GitHub:

- `MARIADB_ROOT_PASSWORD`
- `MARIADB_PASSWORD`

Example GitHub Actions snippet:

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Start containers
        env:
          MARIADB_ROOT_PASSWORD: ${{ secrets.MARIADB_ROOT_PASSWORD }}
          MARIADB_PASSWORD: ${{ secrets.MARIADB_PASSWORD }}
        run: |
          cd DockerProject/tomcat
          docker compose up --build -d
```

For local usage, you can export these variables in your shell or place them in a `.env` file before running Docker Compose.

## Rebuild the WAR artifact

If you update the JSP files or assets, rebuild the package with:

```bash
cd tomcat
docker compose build web
```

## Stop the project

```bash
docker compose down
```

## Useful troubleshooting commands

```bash
docker compose ps
docker compose logs -f web
docker compose logs -f db
```
