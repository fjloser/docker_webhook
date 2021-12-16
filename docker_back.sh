#!/bin/bash
WORK_PATH = '/usr/testProject/docker_back'
cd $WORK_PATH
echo "清除老代码"
git reset --hard origin/main
git clean -f
echo "拉取最新代码"
git pull
echo "开始构建"
docker build -t docker_back:1.0 .
echo "停止旧容器并删除旧容器"
docker stop docker_back_container
docker rm docker_back_container
echo "启动新容器"

docker container run -p 3003:3003 --name docker_back_container -d docker_back:1.0