FROM java:8
VOLUME /temp

RUN mkdir -p /var/jenkins_home/data/

WORKDIR /var/jenkins_home/data/

EXPOSE 8843

ADD ./target/jayud-file-1.0.jar ./app.jar

RUN /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' >/etc/timezone
