#/bin/bash

cd `dirname $0`

docker stop jupyter-server > /dev/null 2>&1
docker rm   jupyter-server > /dev/null 2>&1

# Build and run
USER_NAME=$(id -un) \
USER_ID=$(id -u) \
GROUP_NAME=$(id -gn) \
GROUP_ID=$(id -g) \
HOME=/home/${USER_NAME} \
docker build -t jupyter-server .

docker run \
  --name jupyter-server \
  --user ${USER_ID}:${GROUP_ID} \
  --detach \
  --publish 10000:8080 \
  -v /home/coder/jupyter-notes:/home/jovyan/work \
  jupyter-server

