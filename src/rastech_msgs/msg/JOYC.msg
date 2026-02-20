# 통합 제어 활용 조이스틱 매핑 정보 - 참고용 #
std_msgs/Header header

# Sticks #
float32 lsx # Left Stick X Axis / Default : 0 / Range : -1 ~ 1
float32 lsy # Left Stick Y Axis / Default : 0 / Range : -1 ~ 1

float32 rsx # Right Stick X Axis / Default : 0 / Range : -1 ~ 1
float32 rsy # Right Stick Y Axis / Default : 0 / Range : -1 ~ 1

# Triggers #
float32 lt
float32 rt

# Trigger Buttons #
bool ltb
bool rtb

# Stick Buttons #
bool lsb
bool rsb

# Shoulder Buttons #
bool lb # Left Button
bool rb # Right Button

# Action Buttons #
bool eb # East Button
bool wb # West Button
bool sb # South Button
bool nb # North Button

# Direction Buttons #
float32 dx  # Direction Pad Up Button / Default : 0 / Left : 1 / Right : -1
float32 dy  # Direction Pad Down Button / Default : 0 / Left : 1 / Right : -1

# PS5 Buttons #
bool cb # Create Button
bool pb # PS Button
bool ob # Option Button