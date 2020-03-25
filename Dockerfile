#docker镜像制作
FROM golang:latest AS builder
MAINTAINER "anxiaodong"
WORKDIR /home/anxiaodong/jenkins
ADD . /home/anxiaodong/jenkins

COPY ./beehello /home/anxiaodong/jenkins/deployment/script/
EXPOSE 8080
CMD ["/bin/bash", "deployment/script/start.sh"]
#ENTRYPOINT ["./home/anxiaodong/jenkins/deployment/script/beehello"]
FROM scratch AS prod
COPY  --from=builder  /home/anxiaodong/jenkins/deployment/script/beehello .
CMD ["/bin/bash", "deployment/script/start.sh"]
