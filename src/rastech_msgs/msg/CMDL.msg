# ROS Message - Command List #
uint16 UNKNOWN_ID = 0

# Quadruped Robot (1xx) #
# Initialize
uint16 QRS_AUTO_START = 101

# RBQ 조종기 ↔ 외부 조종기(HighLevelCommand)
uint16 QRS_CTRL_MODE = 102

# Switch Gait
uint16 QRS_SIT = 103    # Sitting - Low posture, resting on the ground
uint16 QRS_STAND = 104  # Standing - Neutral posture, ready to walk
uint16 QRS_WALK = 105   # Walk Mode - walking Trot gait
uint16 QRS_AIM = 106    # Aim Mode - Aiming posture for targeting
uint16 QRS_STAIRS = 107  # Stairs Mode - Stair-adaptive gait using camera sensor
uint16 QRS_WAVE = 108   # Wave Mode - walking Walk gait
uint16 QRS_RUN = 109    # Run Mode - High-speed gait (if supported)

# Static
uint16 QRS_STATIC_LOCK = 110
uint16 QRS_STATIC_RDY = 111
uint16 QRS_STATIC_GND = 112

# Error Control
uint16 QRS_RECOVERY_ERROR_CLEAR = 113
uint16 QRS_RECOVERY_FLEX = 114
uint16 QRS_EMERGENCY = 115

# Port Control
uint16 QRS_PWR_EXT = 116
uint16 QRS_PWR_ADD_ON = 117

# COM 보상 추정
uint16 QRS_COM_EST = 118

# 기타 설정
uint16 QRS_SET_BODY_HEIGHT = 119
uint16 QRS_SET_FOOT_HEIGHT = 120
uint16 QRS_SET_MAX_SPEED = 121

# RAS (2xx) #
# 모터 ENABLE/DISABLE
uint16 RAS_ENABLE = 201
uint16 RAS_DISABLE = 202

# 초기 위치
uint16 RAS_HOME_POS = 203
uint16 RAS_INIT_POS = 204

# Predefined Motion
uint16 RAS_PM_1 = 205
uint16 RAS_PM_2 = 206
uint16 RAS_PM_3 = 207
uint16 RAS_PM_4 = 208
uint16 RAS_PM_5 = 209
uint16 RAS_PM_6 = 210

# Move Speed
uint16 RAS_SPD_UP = 211
uint16 RAS_SPD_DOWN = 212

# Position/Orientation
uint16 RAS_CART_DIR_X_PLUS = 213
uint16 RAS_CART_DIR_X_ZERO = 214
uint16 RAS_CART_DIR_X_MINUS = 215
uint16 RAS_CART_DIR_Y_PLUS = 216
uint16 RAS_CART_DIR_Y_ZERO = 217
uint16 RAS_CART_DIR_Y_MINUS = 218
uint16 RAS_CART_DIR_Z_PLUS = 219
uint16 RAS_CART_DIR_Z_ZERO = 220
uint16 RAS_CART_DIR_Z_MINUS = 221

uint16 RAS_CART_DIR_ROLL_CW = 222
uint16 RAS_CART_DIR_ROLL_ZERO = 223
uint16 RAS_CART_DIR_ROLL_CCW = 224
uint16 RAS_CART_DIR_PITCH_CW = 225
uint16 RAS_CART_DIR_PITCH_ZERO = 226
uint16 RAS_CART_DIR_PITCH_CCW = 227
uint16 RAS_CART_DIR_YAW_CW = 228
uint16 RAS_CART_DIR_YAW_ZERO = 229
uint16 RAS_CART_DIR_YAW_CCW = 230

# Gripper
uint16 RAS_GRIPPER_OPEN = 231
uint16 RAS_GRIPPER_CLOSE = 232
