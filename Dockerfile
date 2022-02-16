# syntax=docker/dockerfile:1
FROM openjdk:16-alpine3.13
WORKDIR /app
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
CMD ["./mvnw", "dependency:go-offline"] /bin/sh
COPY src ./src
CMD ["./mvnw", "spring-boot:run"] /bin/sh
