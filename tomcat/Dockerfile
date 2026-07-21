FROM tomcat:10.1.54-jre17-temurin

COPY index.html /usr/local/tomcat/webapps/ROOT/index.html
COPY dist/loginapp.war /usr/local/tomcat/webapps/loginapp.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
