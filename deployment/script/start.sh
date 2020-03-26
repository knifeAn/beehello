#!/usr/bin/env bash
mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2
./beehello
while true
do
    echo "运行正常"
    sleep 10m
done

#cd /home/anxiaodong/jenkins
#docker run --name beehello -p 8083:81 -d beehello:$VERSION
#./beehello
