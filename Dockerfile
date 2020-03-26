#docker镜像制作
FROM alpine:latest
MAINTAINER "anxiaodong"
WORKDIR /home/anxiaodong/jenkins
ADD . /home/anxiaodong/jenkins
RUN echo "https://mirror.tuna.tsinghua.edu.cn/alpine/v3.4/main/" > /etc/apk/repositories
RUN apk update \
        && apk upgrade \
        && apk add --no-cache bash \
        bash-doc \
        bash-completion \
        && rm -rf /var/cache/apk/* \
COPY ./beehello /home/anxiaodong/jenkins/
COPY /var/lib/jenkins/workspace/beehello/src/beehello/deployment/script/start.sh /home/anxiaodong/jenkins/
EXPOSE 8080
CMD ["/bin/bash", "/home/anxiaodong/jenkins/start.sh"]
#ENTRYPOINT ["./home/anxiaodong/jenkins/deployment/script/beehello"]

