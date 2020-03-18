#docker镜像制作
FROM golang:latest
MAINTAINER "anxiaodong"
WORKDIR /home/anxiaodong/go/src/beehello
ADD . /home/anxiaodong/go/src/beehello
RUN go build .
EXPOSE 8083
ENTRYPOINT ["./beehello"]
