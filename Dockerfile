FROM eclipse-temurin:25-jdk AS builder

WORKDIR /app

COPY mvnw mvnw.cmd pom.xml ./
COPY .mvn .mvn

RUN ./mvnw dependency:go-offline -q

COPY src src

RUN ./mvnw package -DskipTests -q

FROM eclipse-temurin:25-jre AS runtime

RUN groupadd --system spring && useradd --system --gid spring spring
USER spring

WORKDIR /app
COPY --from=builder /app/target/lab8-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]