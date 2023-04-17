FROM --platform=linux/arm64/v8 maven:3.8.3-openjdk-17 AS build
COPY src /app/src
COPY pom.xml /app
RUN mvn -f /app/pom.xml clean package


FROM eclipse-temurin:17-jdk-jammy
COPY --from=build /app/target/spring-boot-docker-k8s-0.0.1-SNAPSHOT.jar /app/app.jar
EXPOSE 9090
CMD ["java", "-jar", "/app/app.jar"]
