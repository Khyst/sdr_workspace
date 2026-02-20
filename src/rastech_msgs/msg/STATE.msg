# Rastech용 ROS State Message #
std_msgs/Header header

# 사족보행로봇 상태 정보(Quadruped Robot : qr_*) #
# Base State
geometry_msgs/Pose qr_base_state
geometry_msgs/VelocityStamped qr_base_velocity_state

# Joint State
uint8[12] qr_motor_state
sensor_msgs/JointState qr_joint_state

# Battery State
uint8 BATTERY_MISSING = 1
uint8 BATTERY_CHARGING = 2
uint8 BATTERY_DISCHARGING = 3

float64 qr_battery_voltage
float64 qr_battery_current
float64 qr_battery_state_of_charge
float64 qr_battery_temperature
float64 qr_battery_state

# Gait State
uint8 UNKNOWN = 0
int8 GAIT_FALL = -2   # Fall Mode - Triggered upon unexpected loss of balance
int8 GAIT_OFF = -1    # Control Off - All actuators disabled
int8 GAIT_SIT = 0     # Sitting - Low posture, resting on the ground
int8 GAIT_STAND = 1   # Standing - Neutral posture, ready to walk
int8 GAIT_WALK = 2    # Walk Mode - walking Trot gait
int8 GAIT_AIM = 3     # Aim Mode - Aiming posture for targeting
int8 GAIT_STAIRS = 4  # Stairs Mode - Stair-adaptive gait using camera sensor
int8 GAIT_WAVE = 5    # Wave Mode - walking Walk gait
int8 GAIT_RUN = 6     # Run Mode - High-speed gait (if supported)

int8 qr_gait_state

# Foot State
uint8 FOOT_CONTACT_MADE = 1
uint8 FOOT_CONTACT_LOST = 2

uint8[4] qr_foot_contact

# 로봇팔 상태 정보(Robot Arm : ra_*)#
sensor_msgs/JointState ra_joint_state
geometry_msgs/Pose ra_pose_state

uint16 ra_speed_rate

uint8 ra_ctrl_mode
uint8 ra_arm_status
uint8 ra_mode_feedback
uint8 ra_teach_status
uint8 ra_motion_status
uint8 ra_trajectory_num
int64 ra_err_code

bool[6] ra_joint_enabled
bool[6] ra_joint_angle_limit
bool[6] ra_joint_comm_status


