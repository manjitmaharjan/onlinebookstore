FROM tomcat:8
#COPY ./target/*.war app.war

#ADD ./target/*.war /usr/local/tomcat/webapps/.
ADD ./target/*.war /usr/local/tomcat/webapps/app.war



#ENTRYPOINT [ "sh", "-c", "java -jar onlinebookstore-0.0.1-SNAPSHOT.war"]


