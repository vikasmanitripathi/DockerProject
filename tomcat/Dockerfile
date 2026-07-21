FROM tomcat:10.1.54-jre17-temurin

RUN apt-get update && apt-get install -y --no-install-recommends default-jdk-headless libmariadb-java && rm -rf /var/lib/apt/lists/*

COPY index.html /usr/local/tomcat/webapps/ROOT/index.html
COPY loginapp /usr/local/tomcat/webapps/loginapp

RUN mkdir -p /tmp/loginapp-src && cp -r /usr/local/tomcat/webapps/loginapp /tmp/loginapp-src/loginapp && \
    javac -cp /usr/share/java/mariadb-java-client.jar -d /usr/local/tomcat/webapps/loginapp/WEB-INF/classes /tmp/loginapp-src/loginapp/WEB-INF/classes/DbUtil.java && \
    cp /usr/share/java/mariadb-java-client.jar /usr/local/tomcat/lib/ && \
    rm -rf /tmp/loginapp-src

EXPOSE 8080

CMD ["catalina.sh", "run"]
