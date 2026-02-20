# Rastech용 ROS Command Message #
std_msgs/Header header
# Robot ID #
# r_id = 1 : = SDR_R1_R_ID : 사족보행 로봇 + 멀티모달센서 플랫폼
# r_id = 2 : = SDR_R2_R_ID : 사족보행 로봇 + 멀티모달센서 + 로봇팔 플랫폼
# r_id = 3 : = SDR_R3_R_ID : 휴머노이드 플랫폼
# IDXL.msg 내 사전 정의 되어 있음
uint16 r_id

# System ID #
# s_id = 1 : = SDR_R1_ICS_ID : 통합 운용(SDR_R1 플랫폼)
# s_id = 2 : = SDR_R2_ICS_ID : 통합 운용(SDR_R2 플랫폼)
# s_id = 3 : = SDR_R3_ICS_ID : 통합 운용(SDR_R3 플랫폼)
# s_id = 4 : = SDR_QRS_ID : 개별 운용(사족보행 로봇)
# s_id = 5 : = SDR_MMS_ID : 개별 운용(멀티모달센서)
# s_id = 6 : = SDR_RAS_ID : 개별 운용(로봇팔)
# s_id = 7 : = SDR_HRS_ID : 개별 운용(휴머노이드)
# IDXL.msg 내 사전 정의 되어 있음
uint16 s_id

# Command ID #
uint16 c_id
# CMDL.msg 내 사전 정의 되어 있음
# QRS_* : 사족보행 로봇 관련 명령
# RAS_* : 로봇팔 관련 명령

# Gait Command (상태값 정의와 차이가 있어 별도로 둠, GAIT_AIM, GAIT_WALK 순서)
int8 GAIT_SIT = 0     # Sitting - Low posture, resting on the ground
int8 GAIT_STAND = 1   # Standing - Neutral posture, ready to walk
int8 GAIT_AIM = 2     # Aim Mode - Aiming posture for targeting
int8 GAIT_WALK = 3    # Walk Mode - walking Trot gait
int8 GAIT_STAIRS = 4  # Stairs Mode - Stair-adaptive gait using camera sensor
int8 GAIT_WAVE = 5    # Wave Mode - walking Walk gait
int8 GAIT_RUN = 6     # Run Mode - High-speed gait (if supported)