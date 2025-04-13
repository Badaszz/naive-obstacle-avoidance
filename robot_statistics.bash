#! /usr/bin/bash

# include the functions library
source ./robot_functions.bash

# robot statistics

# this is an infinite while loop - use ctrl+c to break
echo "Running Robot Statistics with Bash Script..."
echo "Press Ctrl+C to Terminate..."

# main while loop for naive obstacle avoider
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
while :
do
  # print distance covered since start
  # ...
  distance_covered=$(get_odom_distance)
  echo "distance covered: $distance_covered meters"
  # print current direction of robot
  # ...
  direction=$(get_odom_direction)
  echo "Robot direction: $direction"
  # print odom position x, y, z
  # ...
  positionx=$(get_odom_position_x)
  echo "position x: $positionx"
  positiony=$(get_odom_position_y)
  echo "position y: $positiony"
  positionz=$(get_odom_position_z)
  echo "position z: $positionz"
  # print odom orientation r, p, y
  # ...
  orientationr=$(get_odom_orientation_r)
  echo "orientation r: $orientationr"
  orientationp=$(get_odom_orientation_p)
  echo "orientation p: $orientationp"
  orientationy=$(get_odom_orientation_y)
  echo "orientation y: $orientationy"
  # print imu angular velocity x, y, z
  # ...
  avx=$(get_imu_angular_velocity_x)
  echo "imu angular velocity x: $avx"
  avy=$(get_imu_angular_velocity_y)
  echo "imu angular velocity y: $avy"
  avz=$(get_imu_angular_velocity_z)
  echo "imu angular velocity z: $avz"
  # print imu linear acceleration x, y, z
  # ...
  alx=$(get_imu_linear_velocity_x)
  echo "imu linear velocity x: $alx"
  aly=$(get_imu_linear_velocity_y)
  echo "imu linear velocity y: $aly"
  alz=$(get_imu_angular_velocity_z)
  echo "imu linear velocity z: $alz"

  # print a divider line to show iteration is complete
  echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
done

# End of Code