FROM openjdk:8-jre

MAINTAINER yeluod <yeluo0528@gmail.com>

EXPOSE 8080

VOLUME /tmp

ADD /sentinel-dashboard/target/sentinel-dashboard.jar app.jar

# 设置时区
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo '$TZ' > /etc/timezone

ENTRYPOINT ["java","-jar","-Dserver.port=8080","-Dcsp.sentinel.dashboard.server=127.0.0.1:8080","-Dproject.name=sentinel-dashboard","/app.jar"]
