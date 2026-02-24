#!/bin/bash
set -e # 에러 발생 시 즉시 중단

WORKSPACE_DIR="$HOME/workspace"

echo "--- Installing Python requirements ---"
if [ -f "$WORKSPACE_DIR/src/data-bridge/requirements.txt" ]; then
    pip3 install -r "$WORKSPACE_DIR/src/data-bridge/requirements.txt"
fi

echo "--- ROS 2 Dependency Update ---"
sudo rosdep update
# 의존성 설치 시 humble 명시 및 환경 인식 강화
rosdep install --from-paths src --ignore-src -r -y --rosdistro humble

echo "--- Setting permissions ---"
sudo chown -R $(whoami) "$WORKSPACE_DIR"

echo "--- Building ROS 2 workspace ---"
source /opt/ros/humble/setup.bash
cd "$WORKSPACE_DIR"
colcon build --symlink-install

# --- .bashrc 설정 (중복 방지 로직 적용) ---
echo "--- Configuring .bashrc ---"

add_to_bashrc() {
    local line="$1"
    if ! grep -qF "$line" ~/.bashrc; then
        echo "$line" >> ~/.bashrc
    fi
}

# 작업 공간 setup 추가
add_to_bashrc "source /opt/ros/humble/setup.bash"
add_to_bashrc "source $WORKSPACE_DIR/install/local_setup.bash"

# 통신 설정 (호스트 공유를 위한 필수 설정)
add_to_bashrc "export ROS_DOMAIN_ID=42"
add_to_bashrc "export ROS_LOCALHOST_ONLY=0"
# 필요 시 RMW 강제 설정 (통신 불량 시 CycloneDDS 권장)
# add_to_bashrc "export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp"

# Alias 설정
add_to_bashrc "alias sb='source ~/.bashrc'"
add_to_bashrc "alias cb='colcon build --symlink-install'"
add_to_bashrc "alias rosdep_install='rosdep install --from-paths src --ignore-src -y'"

echo "Setup complete! Please run 'source ~/.bashrc' or restart your terminal."