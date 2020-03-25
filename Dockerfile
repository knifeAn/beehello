#docker镜像制作
FROM golang:latest AS build
MAINTAINER "anxiaodong"
WORKDIR /home/anxiaodong/jenkins
ADD . /home/anxiaodong/jenkins
FROM scratch AS prod
RUN echo "https://mirror.tuna.tsinghua.edu.cn/alpine/v3.4/main/" > /etc/apk/repositories
RUN apk update \
        && apk upgrade \
        && apk add --no-cache bash \
        bash-doc \
        bash-completion \
        && rm -rf /var/cache/apk/* \
COPY ./beehello /home/anxiaodong/jenkins/deployment/script/
EXPOSE 8080
CMD ["/bin/bash", "deployment/script/start.sh"]
#ENTRYPOINT ["./home/anxiaodong/jenkins/deployment/script/beehello"]

