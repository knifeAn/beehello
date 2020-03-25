#docker镜像制作
FROM golang:latest
MAINTAINER "anxiaodong"
WORKDIR /home/anxiaodong/jenkins
ADD . /home/anxiaodong/jenkins
FROM scratch AS prod
COPY ./beehello /home/anxiaodong/jenkins/deployment/script/ 
EXPOSE 8080
#CMD ["/bin/bash", "deployment/script/start.sh"]
CMD ["./home/anxiaodong/jenkins/deployment/script/beehello"]
ENTRYPOINT ["./home/anxiaodong/jenkins/deployment/script/beehello"]
