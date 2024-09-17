#!/bin/bash -
#===============================================================================
#
#          FILE: start_ros.sh
#
#         USAGE: ./start_ros.sh
#
#   DESCRIPTION: инициализирует и запускает узлы ROS, указанные в demo_launch.launch 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Oleg Sokolov (+7 918 200 111 7), os-sochi@mail.ru
#  ORGANIZATION: Skillbox, Drone Programming
#       CREATED: 04.05.2024 14:16:50
#      REVISION:  ---
#===============================================================================

#set -euxo pipefail  #~/.vim/plugged/bash-support/bash-support/templates/Templates:str68

source /opt/ros/noetic/setup.bash
roslaunch /home/sapsan/Documents/Module2/PW2/Scripts/demo-launch.launch
