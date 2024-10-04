# Stage 1: Build the application
FROM maven:3.8.6-openjdk-17-slim AS build
LABEL maintainer="vignan"

WORKDIR /opt/app

# Copy only the necessary files for the build
COPY pom.xml ./
COPY src ./src

# Build the application
RUN mvn clean package -DskipTests

# Stage 2: Create a minimal runtime image
FROM openjdk:17-jdk-slim
LABEL maintainer="vignan"

WORKDIR /opt/app

# Copy the jar file from the build stage
COPY --from=build /opt/app/target/gs-spring-boot-0.1.0.jar /opt/app/gs-spring-boot-0.1.0.jar

# Expose the necessary port
EXPOSE 8082

# Run the application
CMD ["java", "-jar", "/opt/app/gs-spring-boot-0.1.0.jar"]