# ---- Etapa 1: compilar los 5 módulos (dominio, core, aplicacion, infraestructura, presentacion) ----
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /build
COPY . .
RUN mvn -q -B clean package -DskipTests

# ---- Etapa 2: imagen liviana solo con el JRE y el jar ejecutable ----
FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=build /build/presentacion/target/presentacion-*.jar app.jar
EXPOSE 8081
ENTRYPOINT ["java", "-jar", "app.jar"]
