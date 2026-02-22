#!/bin/bash
set -e # 에러 발생 시 즉시 중단

echo "--- Installing Python requirements ---"
if [ -f src/data-bridge/requirements.txt ]; then
    pip3 install -r src/data-bridge/requirements.txt
fi

echo "--- ROS 2 Dependency Update ---"
sudo rosdep update
sudo rosdep install --from-paths src --ignore-src -y

echo "--- Setting permissions ---"
sudo chown -R $(whoami) /home/${USERNAME}/workspace

echo "--- Building ROS 2 workspace ---"
source /opt/ros/humble/setup.bash
cd /home/${USERNAME}/workspace
colcon build --symlink-install
echo "source /home/${USERNAME}/workspace/install/local_setup.bash" >> ~/.bashrc

echo "--- add alias to bashrc ---"
echo "alias sb='source ~/.bashrc'" >> ~/.bashrc
echo "alias cb='colcon build --symlink-install'" >> ~/.bashrc
echo "alias rosdep_install='rosdep install --from-paths src --ignore-src -y'" >> ~/.bashrc

echo "Setup complete!"