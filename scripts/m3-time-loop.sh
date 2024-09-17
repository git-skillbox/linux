#!/bin/bash -
#===============================================================================
#
#          FILE: time_loop.sh
#
#         USAGE: ./time_loop.sh
#
#   DESCRIPTION: бесконечно датый скрипт 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Oleg Sokolov (+7 918 200 111 7), os-sochi@mail.ru
#  ORGANIZATION: Skillbox, Drone Programming
#       CREATED: 13.06.2024 20:15:30
#      REVISION:  ---
#===============================================================================

set -euxo pipefail  #~/.vim/plugged/bash-support/bash-support/templates/Templates:str68

while true; do
  # Вывод текущей даты и времени
  echo $(date '+%d-%m-%Y %H:%M:%S')
  
  # Задержка на 1 секунду
  sleep 1
done

