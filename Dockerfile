FROM maven:amazoncorretto as build
WORKDIR /java
COPY . .
RUN mvn clean install

FROM openjdk:9
WORKDIR /app
COPY --from=build /java/target/gs-maven-0.1.0.jar app.jar
CMD ["java", "-jar", "app.jar"]
