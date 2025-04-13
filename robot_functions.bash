#!/usr/bin/bash

# =====================
# Getter Functions
# =====================

# Function to get the linear velocity of the robot
get_cmd_vel_linear() {
  ros2 param get /robot_interface cmd_vel_linear | awk '{print $4}'
}

# Function to get the angular velocity of the robot
get_cmd_vel_angular() {
  ros2 param get /robot_interface cmd_vel_angular | awk '{print $4}'
}

# Function to get the minimum angle of the laser scan
get_scan_angle_min() {
  ros2 param get /robot_interface scan_angle_min | awk '{print $4}'
}

# Function to get the maximum angle of the laser scan
get_scan_angle_max() {
  ros2 param get /robot_interface scan_angle_max | awk '{print $4}'
}

# Function to get the increment angle of the laser scan
get_scan_angle_increment() {
  ros2 param get /robot_interface scan_angle_increment | awk '{print $4}'
}

# Function to get the minimum range of the laser scan
get_scan_range_min() {
  ros2 param get /robot_interface scan_range_min | awk '{print $4}'
}

# Function to get the maximum range of the laser scan
get_scan_range_max() {
  ros2 param get /robot_interface scan_range_max | awk '{print $4}'
}

# Function to get the count of ranges in the laser scan
get_scan_ranges_count() {
  ros2 param get /robot_interface scan_ranges_count | awk '{print $4}'
}

# Function to get the array of ranges in the laser scan
get_scan_ranges_array() {
  ros2 param get /robot_interface scan_ranges_array | awk '{print $4}'
}

# Function to get the index of the back ray in the laser scan
get_scan_back_ray_index() {
  ros2 param get /robot_interface scan_back_ray_index | awk '{print $4}'
}

# Function to get the index of the right ray in the laser scan
get_scan_right_ray_index() {
  ros2 param get /robot_interface scan_right_ray_index | awk '{print $4}'
}

# Function to get the index of the front right ray in the laser scan
get_scan_front_right_ray_index() {
  ros2 param get /robot_interface scan_front_right_ray_index | awk '{print $4}'
}

# Function to get the index of the front ray in the laser scan
get_scan_front_ray_index() {
  ros2 param get /robot_interface scan_front_ray_index | awk '{print $4}'
}

# Function to get the index of the front left ray in the laser scan
get_scan_front_left_ray_index() {
  ros2 param get /robot_interface scan_front_left_ray_index | awk '{print $4}'
}

# Function to get the index of the left ray in the laser scan
get_scan_left_ray_index() {
  ros2 param get /robot_interface scan_left_ray_index | awk '{print $4}'
}

# Function to get the range of a specific ray in the laser scan
get_scan_ray_range() {
  ros2 param get /robot_interface scan_ray_range | awk '{print $4}'
}

# Function to get the range of the back ray in the laser scan
get_scan_back_ray_range() {
  ros2 param get /robot_interface scan_back_ray_range | awk '{print $4}'
}

# Function to get the range of the right ray in the laser scan
get_scan_right_ray_range() {
  ros2 param get /robot_interface scan_right_ray_range | awk '{print $4}'
}

# Function to get the range of the front right ray in the laser scan
get_scan_front_right_ray_range() {
  ros2 param get /robot_interface scan_front_right_ray_range | awk '{print $4}'
}

# Function to get the range of the front ray in the laser scan
get_scan_front_ray_range() {
  ros2 param get /robot_interface scan_front_ray_range | awk '{print $4}'
}

# Function to get the range of the front left ray in the laser scan
get_scan_front_left_ray_range() {
  ros2 param get /robot_interface scan_front_left_ray_range | awk '{print $4}'
}

# Function to get the range of the left ray in the laser scan
get_scan_left_ray_range() {
  ros2 param get /robot_interface scan_left_ray_range | awk '{print $4}'
}

# Function to get the x position in the odometry
get_odom_position_x() {
  ros2 param get /robot_interface odom_position_x | awk '{print $4}'
}

# Function to get the y position in the odometry
get_odom_position_y() {
  ros2 param get /robot_interface odom_position_y | awk '{print $4}'
}

# Function to get the z position in the odometry
get_odom_position_z() {
  ros2 param get /robot_interface odom_position_z | awk '{print $4}'
}

# Function to get the distance traveled in the odometry
get_odom_distance() {
  ros2 param get /robot_interface odom_distance | awk '{print $4}'
}

# Function to get the roll orientation in the odometry
get_odom_orientation_r() {
  ros2 param get /robot_interface odom_orientation_r | awk '{print $4}'
}

# Function to get the pitch orientation in the odometry
get_odom_orientation_p() {
  ros2 param get /robot_interface odom_orientation_p | awk '{print $4}'
}

# Function to get the yaw orientation in the odometry
get_odom_orientation_y() {
  ros2 param get /robot_interface odom_orientation_y | awk '{print $4}'
}

# Function to get the direction in the odometry
get_odom_direction() {
  ros2 param get /robot_interface odom_direction | awk '{print $4}'
}

# Function to get the x component of angular velocity in the IMU
get_imu_angular_velocity_x() {
  ros2 param get /robot_interface imu_angular_velocity_x | awk '{print $4}'
}

# Function to get the y component of angular velocity in the IMU
get_imu_angular_velocity_y() {
  ros2 param get /robot_interface imu_angular_velocity_y | awk '{print $4}'
}

# Function to get the z component of angular velocity in the IMU
get_imu_angular_velocity_z() {
  ros2 param get /robot_interface imu_angular_velocity_z | awk '{print $4}'
}

# Function to get the x component of linear acceleration in the IMU
get_imu_linear_acceleration_x() {
  ros2 param get /robot_interface imu_linear_acceleration_x | awk '{print $4}'
}

# Function to get the y component of linear acceleration in the IMU
get_imu_linear_acceleration_y() {
  ros2 param get /robot_interface imu_linear_acceleration_y | awk '{print $4}'
}

# Function to get the z component of linear acceleration in the IMU
get_imu_linear_acceleration_z() {
  ros2 param get /robot_interface imu_linear_acceleration_z | awk '{print $4}'
}

# =====================
# Setter Functions
# =====================

# Function to set the linear velocity of the robot
set_cmd_vel_linear () {
  ros2 param set /robot_interface cmd_vel_linear "$1"
  return 0
}

# Function to set the angular velocity of the robot
set_cmd_vel_angular () {
  ros2 param set /robot_interface cmd_vel_angular "$1"
  return 0
}

# Function to set the index of the ray in the laser scan
set_scan_ray_index () {
  ros2 param set /robot_interface scan_ray_index "$1"
  return 0
}

# End of Code
### Optimized code, with comments