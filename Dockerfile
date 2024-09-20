# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the Spring Boot JAR to the container
COPY target/spring-boot-docker-k8s-0.0.1-SNAPSHOT.jar /app/spring-boot-docker-k8s-0.0.1-SNAPSHOT.jar

# Expose port 8080 for Spring Boot
EXPOSE 8080

# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "/app/spring-boot-docker-k8s-0.0.1-SNAPSHOT.jar"]
