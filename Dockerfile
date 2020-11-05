FROM tomcat:8

#apt update

COPY ./target/onlinebookstore-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/.
#CMD "echo","done"
#CMD java -jar java-tomcat-maven-example.war
#CMD ["catalina.sh","run"]

#EXPOSE 8080
