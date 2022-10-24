FROM openjdk
EXPOSE 8080
ADD target/achat-1.0-kch.jar achat-1.0-kch.jar
ENTRYPOINT ["java","-jar","/achat-1.0-kch.jar"]
