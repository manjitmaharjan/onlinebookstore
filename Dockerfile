FROM tomcat:8 as build
Workdir /app
ADD ./target/onlinebookstore-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/.
COPY . .
#CMD "echo","done"
#CMD java -jar java-tomcat-maven-example.war
#CMD ["catalina.sh","run"]

#EXPOSE 8080
#FROM openjdk:8
#ARG JAR_FILE=./target/*.war
#RUN mkdir ./upload
#COPY ${JAR_FILE} onlinebookstore-0.0.1-SNAPSHOT.war

#ENV JAVA_OPTS="-Xmx264m -Xms128m"
#ENV SPRING_PROFILES_ACTIVE="docker,chaos-monkey"
#ENTRYPOINT [ "sh", "-c", "java -jar onlinebookstore-0.0.1-SNAPSHOT.war"]

FROM nginx:alpine
# copy the build folder from react to the root of nginx (www)
COPY --from=build /app /usr/share/nginx/html
# expose port
EXPOSE 80
