FROM openjdk:8-jre-alpine
COPY /build/libs/stock.jar /opt/stock.jar
ENTRYPOINT ["java", "-jar", "/opt/stock.jar"]
EXPOSE 8080