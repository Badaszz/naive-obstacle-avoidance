#! /usr/bin/bash

# include the functions library
source ./robot_functions.bash

# naive obstacle avoider

# this is an infinite while loop - use ctrl+c to break
echo "Running Naive Obstacle Avoider with Bash Script..."
echo "Press Ctrl+C to Terminate..."

# make sure that the robot is stopped initially
# set linear velocity to zero here
# ...
set_cmd_vel_linear 0.000

# set angular velocity to zero here
# ...
set_cmd_vel_angular 0.000

# set obstacle avoidance distance threshold
# ...
threshold=0.300

# your own function definitions, if you have any
# ...
# ...
# ...


# main while loop for naive obstacle avoider
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
while :
do
  # get all the five scan ranges
  # get the left scan range
  # ...
  lft_range=$(get_scan_left_ray_range)
  echo "left range: $lft_range meters"
  # get the front left scan range
  # ...
  flft_range=$(get_scan_front_left_ray_range)
  echo "front left range: $flft_range meters"
  # get the front scan range
  # ...
  ff_range=$(get_scan_front_ray_range)
  echo "front range: $ff_range meters"
  # get the front right scan range
  # ...
  frght_range=$(get_scan_front_right_ray_range)
  echo "front right range: $frght_range meters"
  # get the right scan range
  # ...
  rght_range=$(get_scan_right_ray_range)
  echo "right range: $rght_range meters"

  # check if the three frontal scan ranges are less than threshold
  # check if front left scan is less than threshold
  # ...
  front_left_free=$(echo "$flft_range > $threshold" | bc -l)
  echo "front_left_free: $front_left_free"
  # check if front scan is less than threshold
  # ...
  front_free=$(echo "$ff_range > $threshold" | bc -l)
  echo "front_free: $front_free"
  # check if front right scan is less than threshold
  # ...
  front_right_free=$(echo "$frght_range > $threshold" | bc -l)
  echo "front_right_free: $front_right_free"

  # provide conditions for 8 different cases of frontal scan ranges
  # if front left is not free and front is not free and front right is not free
  # ...
  if [[ "$front_free" == "0" && "$front_right_free" == "0" && "$front_left_free" == "0" ]]; then
    # decide direction to turn based on left and right scan ranges
    # if left scan range is more than right scan range
      # turn left
      # ...
    if (( $(echo "$lft_range > $rght_range" | bc -l ) )); then
        echo "turning left..."
        set_cmd_vel_angular 0.31416
        sleep 1.500
        set_cmd_vel_angular 0.000
    else
        echo "turning right..."
        set_cmd_vel_angular -0.31416
        sleep 1.500
        set_cmd_vel_angular 0.000
    fi
  # elif front left is not free and front is not free and front right is free
    # turn right
    # ...
  elif [[ "$front_free" == "0" && "$front_right_free" == "1" && "$front_left_free" == "0" ]]; then
    echo "turning right..."
    set_cmd_vel_angular -0.31416
    sleep 1.500
    set_cmd_vel_angular 0.000
  # elif front left is not free and front is free and front right is not free
    # move forward for roughly (front range - threshold) meters
    # ...
  elif [[ "$front_free" == "1" && "$front_right_free" == "0" && "$front_left_free" == "0" ]]; then
    dist_to_move=$(echo "$ff_range - $threshold" | bc -l) 
    # calculate time with fixed speed of 0.1 m/s
    # ...
    time_to_move=$(echo "$dist_to_move / 0.100" | bc -l)
    # subtract 1 second for parameter setting delay
    # ...
    # ...
    # ...
    time_to_move=$(echo "$time_to_move - 1.000" | bc -l)
    set_cmd_vel_linear 0.100
    sleep $time_to_move
    # set linear velocity back to zero
    # ...
    set_cmd_vel_linear 0.000
  # elif front left is not free and front is free and front right is free
    # turn right
    # ...
  elif [[ "$front_free" == "1" && "$front_right_free" == "1" && "$front_left_free" == "0" ]]; then
    dist_to_move=$(echo "$ff_range - $threshold" | bc -l)
    # calculate time with fixed speed of 0.1 m/s
    # ...
    time_to_move=$(echo "$dist_to_move / 0.100" | bc -l)
    # subtract 1 second for parameter setting delay
    # ...
    # ...
    # ...
    time_to_move=$(echo "$time_to_move - 1.000" | bc -l)
    echo "dist_to_move: $dist_to_move meters"
    echo "time_to_move: $time_to_move seconds"
    echo "moving forward..."
    set_cmd_vel_linear 0.100
    sleep $time_to_move
    # set linear velocity back to zero
    # ...
    set_cmd_vel_linear 0.000
  # elif front left is free and front is not free and front right is not free
    # turn left
    # ...
  elif [[ "$front_free" == "0" && "$front_right_free" == "0" && "$front_left_free" == "1" ]]; then
    echo "turning left..."
    set_cmd_vel_angular 0.31416
    sleep 1.500
    set_cmd_vel_angular 0.000
  # elif front left is free and front is not free and front right is free
  elif [[ "$front_free" == "0" && "$front_right_free" == "1" && "$front_left_free" == "1" ]]; then
    # decide direction to turn based on left and right scan ranges
    # if left scan range is more than right scan range
      # turn left
      # ...
    if (( $(echo "$lft_range > $rght_range" | bc -l ) )); then
        echo "turning left..."
        set_cmd_vel_angular 0.31416
        sleep 1.500
        set_cmd_vel_angular 0.000
    else
        echo "turning right..."
        set_cmd_vel_angular -0.31416
        sleep 1.500
        set_cmd_vel_angular 0.000
    fi
  # elif front left is free and front is free and front right is not free
    # turn left
    # ...
  elif [[ "$front_free" == "1" && "$front_right_free" == "0" && "$front_left_free" == "1" ]]; then
    dist_to_move=$(echo "$ff_range - $threshold" | bc -l)
    # calculate time with fixed speed of 0.1 m/s
    # ...
    time_to_move=$(echo "$dist_to_move / 0.100" | bc -l)
    # subtract 1 second for parameter setting delay
    # ...
    # ...
    # ...
    time_to_move=$(echo "$time_to_move - 1.000" | bc -l)
    echo "dist_to_move: $dist_to_move meters"
    echo "time_to_move: $time_to_move seconds"
    echo "moving forward..."
    set_cmd_vel_linear 0.100
    sleep $time_to_move
    # set linear velocity back to zero
    # ...
    set_cmd_vel_linear 0.000
  # else
  else
    # if front left is free and front is free and front right is free
    # move forward for roughly (front range - threshold) meters
    # ...
    dist_to_move=$(echo "$ff_range - $threshold" | bc -l)
    # calculate time with fixed speed of 0.1 m/s
    # ...
    time_to_move=$(echo "$dist_to_move / 0.100" | bc -l)
    # subtract 1 second for parameter setting delay
    # ...
    # ...
    # ...
    time_to_move=$(echo "$time_to_move - 1.000" | bc -l)
    echo "dist_to_move: $dist_to_move meters"
    echo "time_to_move: $time_to_move seconds"
    echo "moving forward..."
    set_cmd_vel_linear 0.100
    sleep $time_to_move
    # set linear velocity back to zero
    # ...
    set_cmd_vel_linear 0.000
  fi
  # print a divider line to show iteration is complete
  echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
done
# End of Code
