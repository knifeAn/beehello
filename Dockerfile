#docker镜像制作
FROM golang:latest
MAINTAINER "anxiaodong"
WORKDIR /home/anxiaodong/jenkins
ADD . /home/anxiaodong/jenkins
#RUN go build .
EXPOSE 8083
ENTRYPOINT ["./beehello"]
