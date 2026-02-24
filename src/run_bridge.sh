#!/bin/bash

# 1. ROS 2 및 워크스페이스 환경 로드
source /opt/ros/humble/setup.bash

if [ -f "/home/rastech/workspace/install/setup.bash" ]; then
    source /home/rastech/workspace/install/setup.bash
fi

# 2. 통신 네트워크 설정 (호스트 공유용)
export ROS_DOMAIN_ID=42
export ROS_LOCALHOST_ONLY=0
export RMW_IMPLEMENTATION=rmw_fastrtps_cpp

# 종료 시 백그라운드 프로세스 종료 (에러 출력 방지 추가)
trap 'kill $(jobs -p) 2>/dev/null' EXIT

echo "--- Starting ROS 2 Nodes (Domain: $ROS_DOMAIN_ID) ---"

# 첫 번째: Dummy Data Publisher
echo "[1/3] Launching Dummy Data Publisher..."
ros2 launch data-bridge dummy_data_publish_ver2.launch.py &
sleep 3

# 두 번째: Rosbag Play
echo "[2/3] Starting Rosbag Play..."
(cd /home/rastech/workspace/src/rosbag2_img_state/ && ros2 bag play . --loop) &
sleep 2

# 세 번째: Data Bridge (Foreground 실행)
echo "[3/3] Launching Data Bridge..."
ros2 launch data-bridge data_bridge.launch.py
