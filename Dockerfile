FROM maven:3-alpine
EXPOSE 8090
ADD target/achat-1.0-s7.jar achat-1.0-s7.jar
ENTRYPOINT [ "java", "-jar", "/achat-1.0-s7.jar"]
