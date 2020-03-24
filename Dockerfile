#docker镜像制作
FROM golang:latest
MAINTAINER "anxiaodong"
WORKDIR /home/anxiaodong/jenkins
ADD . /home/anxiaodong/jenkins
COPY ./deployment/script/start.sh /home/anxiaodong/jenkins/script/start.sh
#RUN go build .
EXPOSE 81
CMD ["/bin/bash", "deployment/script/start.sh"]
#ENTRYPOINT ["./beehello"]
