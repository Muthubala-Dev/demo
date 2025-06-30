# Base image with Maven and JDK
FROM maven:3.9.6-eclipse-temurin-17 as builder

# Set working dir and copy source
WORKDIR /app
COPY . .

# Build the project (skip tests for faster build)
RUN mvn clean package -DskipTests

# ---- Create final image ----
FROM openjdk:17-jdk-slim
WORKDIR /app

# Copy built jar from previous stage
COPY --from=builder /app/target/*.jar app.jar

# Expose port
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
