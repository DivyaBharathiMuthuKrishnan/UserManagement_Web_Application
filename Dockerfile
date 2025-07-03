# Use an official Java runtime as a parent image
FROM eclipse-temurin:17-jdk

# Set the working directory in the container
WORKDIR /app

# Copy the built jar from your local machine to the container
COPY target/usermanagement-0.0.1-SNAPSHOT.jar app.jar

# Expose port 8080 to the outside
EXPOSE 8080

# Run the jar file
ENTRYPOINT ["java", "-jar", "app.jar"]
