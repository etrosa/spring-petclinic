# syntax=docker/dockerfile:1
FROM openjdk:8-jre-alpine
WORKDIR /app
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
CMD ["./mvnw", "dependency:go-offline"]
COPY src ./src
CMD ["./mvnw", "spring-boot:run"]
