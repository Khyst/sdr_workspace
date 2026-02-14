FROM ros:humble

# 사용자 및 그룹 설정
ARG USERNAME=USERNAME
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# 기존 사용자 제거 (예: ubuntu)
RUN if id -u ${USER_UID} >/dev/null 2>&1; then \
      userdel -r $(id -un ${USER_UID}) || true; \
    fi

# 새 사용자 추가
RUN groupadd --gid ${USER_GID} ${USERNAME} \
 && useradd --uid ${USER_UID} --gid ${USER_GID} -m ${USERNAME} \
 && apt-get update \
 && apt-get install -y sudo python3-pip \
 && echo "${USERNAME} ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/${USERNAME} \
 && chmod 0440 /etc/sudoers.d/${USERNAME}

# APT 업데이트
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y python3-pip curl git vim wget build-essential libboost-all-dev libeigen3-dev git gedit lsb-release gnupg

# ROS 환경 설정 (기본적인 ROS2 humble은 설치된 이미지를 사용한다)
RUN echo "source /opt/ros/humble/setup.bash" >> /home/${USERNAME}/.bashrc

# rosdep 초기화 및 업데이트
RUN apt-get install -y python3-colcon-common-extensions

# 기본 쉘 설정
ENV SHELL /bin/bash

USER ${USERNAME}
CMD ["/bin/bash"]
