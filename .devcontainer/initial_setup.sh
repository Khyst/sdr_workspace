#!/bin/bash
set -e # 에러 발생 시 즉시 중단

echo "--- Installing Python requirements ---"
if [ -f src/fastapi_relayer_sdr/requirements.txt ]; then
    pip3 install -r src/fastapi_relayer_sdr/requirements.txt
fi

echo "--- ROS 2 Dependency Update ---"
sudo rosdep update
sudo rosdep install --from-paths src --ignore-src -y

echo "--- Setting permissions ---"
sudo chown -R $(whoami) /home/${USERNAME}/workspace

echo "Setup complete!"