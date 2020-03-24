#!/usr/bin/env bash

cd /home/anxiaodong/jenkins
docker run --name beehello -p 8083:81 -d beehello:$VERSION