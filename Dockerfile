FROM tomcat:8
#COPY ./target/*.war app.war
ENV WAR=./target/*.war

#ADD ./target/*.war /usr/local/tomcat/webapps/.
COPY ${WAR} /usr/local/tomcat/webapps/onlinebookstore.war



#ENTRYPOINT [ "sh", "-c", "java -jar onlinebookstore-0.0.1-SNAPSHOT.war"]


