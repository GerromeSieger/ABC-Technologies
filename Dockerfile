FROM maven as build

WORKDIR /app

COPY . /app

RUN mvn install


FROM tomcat:latest

WORKDIR /app/main

COPY --from=build /app/main.m2/repository/com/abc/ABCtechnologies/1.0/ABCtechnologies-1.0.war /app/main

#ARG JAR_FILE=/app/studentsystem-0.0.1-SNAPSHOT.jar

EXPOSE 8080

ENTRYPOINT ["catalina.sh", "run"]