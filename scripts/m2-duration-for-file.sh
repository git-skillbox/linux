#!/bin/bash -
#===============================================================================
#
#          FILE: duration_for_file.sh
#
#         USAGE: ./duration_for_file.sh
#
#   DESCRIPTION: выводит продолжительность каждого видеофайла и суммирует общую
#
#       OPTIONS: ---
#  REQUIREMENTS: использует консольные утилиты ffprobe и awk
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Oleg Sokolov (+7 918 200 111 7), os-sochi@mail.ru
#  ORGANIZATION: Skillbox, Drone Programming
#       CREATED: 12.05.2024 22:48:50
#      REVISION:  ---
#===============================================================================

set -euxo pipefail  #~/.vim/plugged/bash-support/bash-support/templates/Templates:str68

#!/bin/bash

# Инициализация переменной для общей продолжительности
total_duration=0

# Путь к лог-файлу
LOG_FILE="/home/sapsan/Videos/video_durations.log"

# Очистка или создание лог-файла
echo "" > "$LOG_FILE"

# Начало процедуры логирования
echo "Начало логирования: $(date)" >> "$LOG_FILE"

# Находим все видеофайлы формата .mp4 в указанном каталоге и его подкаталогах
find /home/sapsan/Videos -type f -name "*.mp4" | while read video; do
    # Получаем продолжительность каждого видео с помощью ffprobe и обрабатываем вывод с помощью awk
    duration=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$video" | awk '{printf "%.0f\n", $1}')
    
    # Суммируем общую продолжительность
    total_duration=$((total_duration + duration))
    
    # Конвертируем продолжительность в формат "ЧЧ:ММ:СС"
    duration_hms=$(date -ud "@$duration" +'%H:%M:%S')
    
    # Выводим и логируем продолжительность каждого видео
    echo "Видео: $video, Продолжительность: $duration_hms"
    echo "Видео: $video, Продолжительность: $duration_hms" >> "$LOG_FILE"

# Конвертируем общую продолжительность в формат "ЧЧ:ММ:СС"
total_duration_hms=$(date -ud "@$total_duration" +'%H:%M:%S')

# Выводим и логируем общую продолжительность всех видео
echo "Общая продолжительность всех видео: $total_duration_hms"
echo "Общая продолжительность всех видео: $total_duration_hms" >> "$LOG_FILE"

# Конец процедуры логирования
echo "Конец логирования: $(date)" >> "$LOG_FILE"

done


