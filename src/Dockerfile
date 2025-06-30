# Use an official OpenJDK runtime as base image
FROM openjdk:17-jdk-slim

# Set the working directory
WORKDIR /app

# Copy the jar file (make sure it exists after mvn package)
COPY target/*.jar app.jar

# Expose port (Render will override with its own PORT env variable)
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
