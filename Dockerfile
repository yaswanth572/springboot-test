# Use Amazon Linux 2 as the base image
FROM amazonlinux:latest

# Set the maintainer
LABEL maintainer="Your Name <your.email@example.com>"

# Set the working directory
WORKDIR /opt

# Install OpenJDK 17
RUN yum install java-17-amazon-corretto -y

# Install Maven and other dependencies
RUN yum install -y maven \
    && yum clean all

# Copy all files from the Spring Boot app directory to the container
COPY . /opt

# Run multiple commands
RUN mvn clean install


# Copy the newly created JAR file to the current directory
#COPY target/your-app.jar /opt/

# Set the entry point to run the Java application
ENTRYPOINT [ "java", "-jar", "/opt/target/gs-spring-boot-0.1.0.jar" ]
