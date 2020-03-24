#docker镜像制作
FROM alpine:latest
MAINTAINER "anxiaodong"
WORKDIR /home/anxiaodong/jenkins
ADD . /home/anxiaodong/jenkins
COPY ./beehello /home/anxiaodong/jenkins/deployment/script/
RUN set -x \
    apk update \
    && apk add --no-cache bash bash-doc bash-completion \
    && sed -i 's/ash/bash/g' /etc/passwd \
    && source /root/.bashrc
EXPOSE 8080
CMD ["/bin/bash", "deployment/script/start.sh"]
#ENTRYPOINT ["./beehello"]
