# Build stage
#
FROM maven:3.6.0-jdk-8-alpine AS build
WORKDIR /app
COPY . /app
RUN mvn -v
RUN mvn clean install -DskipTests
#
# Package stage
#
FROM openjdk:8-jre-alpine AS prod
WORKDIR /app
COPY --from=build /app/target/light-ecom-v1-0.0.1-SNAPSHOT.jar /app/light-ecom-v1.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/light-ecom-v1.jar"]
