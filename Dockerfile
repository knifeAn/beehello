#docker镜像制作
FROM golang:latest
MAINTAINER "anxiaodong"
WORKDIR /home/anxiaodong/jenkins
ADD . /home/anxiaodong/jenkins
COPY /home/anxiaodong/jenkins/beehello /home/anxiaodong/jenkins/deployment/script/
#RUN go build .
EXPOSE 81
CMD ["/bin/bash", "deployment/script/start.sh"]
#ENTRYPOINT ["./beehello"]
