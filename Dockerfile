#docker镜像制作
FROM golang:latest
MAINTAINER "kl023011@gmail.com"
WORKDIR /home/anxiaodong/go/src/beehello
ADD . /home/anxiaodong/go/src/beehello
RUN go build .
EXPOSE 8080
ENTRYPOINT ["./beehello"]