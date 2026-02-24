#!/bin/bash

CONTAINER_NAME="naughty_poincare"
# 컨테이너 내의 스크립트 경로
DOCKER_SCRIPT="/home/rastech/workspace/src/run_bridge.sh"

# 1. 도커 컨테이너가 꺼져 있으면 실행
if [ "$(docker inspect -f '{{.State.Running}}' $CONTAINER_NAME 2>/dev/null)" != "true" ]; then
    echo "Container is stopped. Starting $CONTAINER_NAME..."
    docker start $CONTAINER_NAME
    sleep 2 # 시작 대기
fi

# 2. 컨테이너 내부의 스크립트 호출
echo "Executing ROS 2 script inside container..."
docker exec -it $CONTAINER_NAME /bin/bash -c "$DOCKER_SCRIPT"
