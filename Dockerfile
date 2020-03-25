#docker镜像制作
FROM golang:latest AS build
MAINTAINER "anxiaodong"
WORKDIR /home/anxiaodong/jenkins
ADD . /home/anxiaodong/jenkins
CMD ["/bin/bash", "deployment/script/start.sh"]
FROM scratch AS prod
#COPY  --from=build  /home/anxiaodong/jenkins/deployment/script/ .
COPY  ./beehello  /home/anxiaodong/jenkins/deployment/script/ 
EXPOSE 8080
#CMD ["./beehello"]
ENTRYPOINT ["./home/anxiaodong/jenkins/deployment/script/beehello"]
