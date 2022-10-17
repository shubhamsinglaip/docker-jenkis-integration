FROM openjdk:8-jre-alpine3.9
EXPOSE 8080
ADD target/docker-jenkins-integration.jar docker-jenkins-integration.jar
ENTRYPOINT ["java","-jar","/docker-jenkins-integration.jar"]
