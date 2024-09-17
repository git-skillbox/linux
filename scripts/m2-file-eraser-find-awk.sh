#!/bin/bash -
#===============================================================================
#
#          FILE: file_eraser_find_awk.sh
#
#         USAGE: ./file_eraser_find_awk.sh
#
#   DESCRIPTION: простой автоматический "удалятор" файлов старше 7 дней 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: можно, конечно, было использовать варианты с du, sed и xargs,
#                но в задании прописаны find и awk
#
#        AUTHOR: Oleg Sokolov (+7 918 200 111 7), os-sochi@mail.ru
#  ORGANIZATION: Skillbox, Drone Programming
#       CREATED: 12.05.2024 14:01:52
#      REVISION:  ---
#===============================================================================

set -euxo pipefail  #~/.vim/plugged/bash-support/bash-support/templates/Templates:str68

# Установка входных параметров    
PERIOD=7
FOLDER="/media/sapsan/Data4Gb"
THRESHOLD=20
LOG_FILE="/media/sapsan/Data4Gb/deletion_log.txt"

# Функция для удаления файлов старше заданного периода
delete_old_files() {
    find $FOLDER -type f -mtime +$PERIOD -exec rm {} \;
}

# Функция для проверки свободного места на диске
check_disk_space() {
    total=$(df -h $FOLDER | awk 'NR==2{print $2}')
    used=$(df -h $FOLDER | awk 'NR==2{print $3}')
    available=$(df -h $FOLDER | awk 'NR==2{print $4}')
    
    percentage=$(df -h $FOLDER | awk 'NR==2{print $5}' | tr -d '%')
    
    if [ $percentage -lt $THRESHOLD ]; then
        delete_old_files
        echo "Действие: Файлы старше $PERIOD дней удалены." >> $LOG_FILE
    fi
    echo "Информация: Общий объём: $total, Использовано: $used, Свободно: $available, Процент заполнения: $percentage%." >> $LOG_FILE
}

# Вызов функции для проверки свободного места
check_disk_space

