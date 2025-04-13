# 🦾 Naive Obstacle Avoidance in ROS2 Using Bash Scripts

This project implements a basic obstacle avoidance behavior using **Bash scripting** in combination with **ROS2 parameters and topics**. It was created as a final project for the **Linux for Robotics** course on [The Construct](https://www.theconstructsim.com/).

---

## 📁 Project Structure

. ├── robot_interface.py # ROS2 node that interfaces with robot hardware and sensors ├── robot_functions.bash # Library of getter/setter Bash functions for ROS2 parameters ├── obstacle_avoider.bash # Main logic for naive obstacle avoidance (uses robot_functions.bash)


---

## 🧠 How It Works

### 1. `robot_interface.py` (ROS2 Node)
- Subscribes to `/scan`, `/odom`, and `/imu` topics.
- Publishes `/cmd_vel` to control the robot.
- Processes and stores sensor data (e.g., LaserScan, Odometry, IMU) as **ROS2 parameters**.

### 2. `robot_functions.bash`
- Contains **getter and setter Bash functions** for:
  - Laser ranges
  - Odometry
  - IMU data
  - Velocity commands
- These wrap `ros2 param get/set` for easy shell scripting access.

### 3. `obstacle_avoider.bash`
- Main control loop that:
  - Reads laser scan data using `robot_functions.bash`
  - Checks if the path is blocked
  - Decides whether to move forward or rotate (left or right)
  - Sends appropriate velocity commands via parameter updates

---

## 🔧 How to Run

1. **Launch your robot simulation or bringup** with topics `/scan`, `/odom`, `/imu`, and `/cmd_vel` available.

2. **Run the `robot_interface.py` node**:
```bash
ros2 run <your_package_name> robot_interface.py
```

2. **Make your Bash scripts executable**:
```bash
chmod +x obstacle_avoider.bash
chmod +x robot_functions.bash
```

3. Start the obstacle avoider script:
```bash
./obstacle_avoider.bash
```

## ⚙️ Behavior
Uses 5 ray values from the LaserScan:
  - Left
  - Front-Left
  - Front
  - Front-Right
  - Right

If all forward-facing directions are blocked, it compares left vs right and turns toward the side with more space.

If the path is clear, it moves forward for (distance - threshold) meters, using a time-based estimate.
