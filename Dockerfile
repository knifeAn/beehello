#docker镜像制作
FROM golang:latest
MAINTAINER "anxiaodong"
WORKDIR /home/anxiaodong/jenkins
ADD . /home/anxiaodong/jenkins
COPY ./beehello /home/anxiaodong/jenkins/deployment/script/
#RUN go build .
EXPOSE 8084
CMD ["/bin/bash", "deployment/script/start.sh"]
#ENTRYPOINT ["./beehello"]
