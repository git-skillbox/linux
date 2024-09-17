#!/bin/bash -
#===============================================================================
#
#          FILE: duration_for_dir.sh
#
#         USAGE: ./duration_for_dir.sh.sh
#
#   DESCRIPTION: подсчитывает продолжительность видеофайлов в каждом каталоге
#
#       OPTIONS: ---
#  REQUIREMENTS: используются консольные утилиты ffprobe и awk
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Oleg Sokolov (+7 918 200 111 7), os-sochi@mail.ru
#  ORGANIZATION: Skillbox, Drone Programming
#       CREATED: 13.05.2024 07:59:12
#      REVISION:  ---
#===============================================================================

set -euxo pipefail  #~/.vim/plugged/bash-support/bash-support/templates/Templates:str68

#!/bin/bash

# Каталог для поиска
SEARCH_DIR="/home/sapsan/Videos"
total_duration=0

# Путь к лог-файлу
LOG_FILE="/home/sapsan/Videos/video_dir_durations.log"

# Очистка или создание лог-файла
echo "" > "$LOG_FILE"

# Начало процедуры логирования
echo "Начало логирования: $(date)" >> "$LOG_FILE"

# Функция для преобразования "ЧЧ:ММ:СС" в секунды
convert_to_seconds() {
    IFS=: read -r hours minutes seconds <<< "$1"
    echo $((10#${hours} * 3600 + 10#${minutes} * 60 + 10#${seconds}))
}

# Функция для конвертации секунд в формат "ЧЧ:ММ:СС"
convert_to_hms() {
    seconds=$1
    hours=$(($seconds / 3600))
    minutes=$((($seconds % 3600) / 60))
    seconds=$(($seconds % 60))
    printf "%02d:%02d:%02d" $hours $minutes $seconds
}

# Поиск папок
find "$SEARCH_DIR" -type d | while read dir; do
    # Подсчёт продолжительности для каждой папки
    echo "Обрабатывается папка: $dir" >> "$LOG_FILE"
    duration=$(find "$dir" -maxdepth 1 -type f -name "*.mp4" -exec ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 {} \; | awk '{sum += $1} END {printf "%02d:%02d:%02d\n", int(sum/3600), int((sum%3600)/60), int(sum%60)}')
    
    # Конвертируем время в секунды и суммируем общую продолжительность
    duration_in_seconds=$(convert_to_seconds "$duration")
    total_duration=$((total_duration + duration_in_seconds))
    
    # Выводим и логируем продолжительность видео в каталоге
    echo "Общая продолжительность видео в папке $dir: $duration" | tee -a "$LOG_FILE"

# Конвертируем общую продолжительность в формат "ЧЧ:ММ:СС"
total_duration_hms=$(convert_to_hms "$total_duration")

# Выводим и логируем общую продолжительность всех видео
echo "Общая продолжительность всех видео: $total_duration_hms"
echo "Общая продолжительность всех видео: $total_duration_hms" >> "$LOG_FILE"

# Конец процедуры логирования
echo "Конец логирования: $(date)" >> "$LOG_FILE"
done

