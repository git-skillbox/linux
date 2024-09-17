#!/bin/bash -
#===============================================================================
#
#          FILE: socat_port_number.sh
#
#         USAGE: ./socat_port_number.sh
#
#   DESCRIPTION:скрипт извлекает номера созданных виртуальных портов из 
#               вывода 'socat' с блокировкой буферизации и записью в файл.
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: 
#        AUTHOR: Oleg Sokolov (+7 918 200 111 7), os-sochi@mail.ru
#  ORGANIZATION: Skillbox, Drone Programming
#       CREATED: 14.06.2024 10:06:44
#      REVISION:  ---
#===============================================================================

set -euxo pipefail  #~/.vim/plugged/bash-support/bash-support/templates/Templates:str68

# Запустим socat в фоновом режиме и перенаправим вывод в временный файл
socat -d -d pty,raw,echo=0 pty,raw,echo=0 2>&1 | sed -u 3d | stdbuf -oL cut -d " " -f 7 > /home/sapsan/Documents/Module3/Scripts/socat.log &

# Ожидаем, пока socat не создаст виртуальные порты
sleep 1

# Выводим номера созданных виртуальных портов
cat /home/sapsan/Documents/Module3/Scripts/socat.log

