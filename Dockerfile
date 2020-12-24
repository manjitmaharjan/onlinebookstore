FROM tomcat:8
COPY ./target/*.war app.war

ADD ./target/app.war /usr/local/tomcat/webapps/.


#ENTRYPOINT [ "sh", "-c", "java -jar onlinebookstore-0.0.1-SNAPSHOT.war"]


