#!/bin/bash

# 1. ROS 2 기본 환경 설정 (설치된 버전에 맞게 수정: foxy, humble 등)
source /opt/ros/humble/setup.bash

# 2. 사용자 워크스페이스 환경 설정 (빌드된 setup.bash 경로)
# 보통 workspace/install/setup.bash에 위치합니다.
if [ -f "/home/rastech/workspace/install/setup.bash" ]; then
    source /home/rastech/workspace/install/setup.bash
fi

# 3. bashrc shell source
source ~/.bashrc

# 2. 호스트와 토픽 공유를 위한 네트워크 설정
export ROS_DOMAIN_ID=42
export ROS_LOCALHOST_ONLY=0
# RMW 설정이 필요하다면 추가 (기본값인 경우가 많음)
export RMW_IMPLEMENTATION=rmw_fastrtps_cpp

# 1. 종료 시 백그라운드 프로세스들도 함께 종료되도록 설정
trap 'kill $(jobs -p)' EXIT

echo "--- Starting ROS 2 Nodes in Docker Container ---"

# 2. 첫 번째: Dummy Data Publisher (백그라운드 실행)
echo "[1/3] Launching Dummy Data Publisher..."
ros2 launch data-bridge dummy_data_publish_ver2.launch.py &
sleep 3  # 노드 안정화를 위해 약간의 대기

# 3. 두 번째: Rosbag Play (경로 이동 후 백그라운드 실행)
echo "[2/3] Starting Rosbag Play..."
(cd /home/rastech/workspace/src/rosbag2_img_state/ && ros2 bag play . --loop) &
sleep 2

# 4. 세 번째: Data Bridge (포그라운드 실행 - 로그 확인용)
echo "[3/3] Launching Data Bridge..."
ros2 launch data-bridge data_bridge.launch.py

# 세 번째 프로세스가 종료되면 trap에 의해 백그라운드 프로세스들도 종료됩니다.
