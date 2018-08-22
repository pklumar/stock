FROM openjdk:8-jre-alpine
ARG JAR_FILE
COPY ${JAR_FILE} /opt/stock.jar
ENTRYPOINT ["java", "-jar", "/opt/stock.jar"]
EXPOSE 8080