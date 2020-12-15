##FROM tomcat:8

#apt update

##ADD ./target/onlinebookstore-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/.
#CMD "echo","done"
#CMD java -jar java-tomcat-maven-example.war
#CMD ["catalina.sh","run"]

#EXPOSE 8080
FROM openjdk:8
ARG JAR_FILE=./target/*.jar
RUN mkdir ./upload
COPY ${JAR_FILE} app.jar

ENV JAVA_OPTS="-Xmx264m -Xms128m"
#ENV SPRING_PROFILES_ACTIVE="docker,chaos-monkey"
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /onlinebookstore-0.0.1-SNAPSHOT.war"]

