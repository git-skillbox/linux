#!/bin/bash -
#===============================================================================
#
#          FILE: file_eraser_fzf.sh
#
#         USAGE: ./file_eraser_fzf.sh
#
#   DESCRIPTION:удаляет файлы с интерактивным выбором через fzf целевого каталога
#               и бесконечным циклом
#       OPTIONS: ---
#  REQUIREMENTS: требует наличия в системе fzf (sudo apt install fzf)
#          BUGS: ---
#         NOTES: можно было бы прописать в скрипте проверку на наличие fzf и его 
#               автоматическую установку, но это было бы уже слишком для 2 модуля ;)
#
#        AUTHOR: Oleg Sokolov (+7 918 200 111 7), os-sochi@mail.ru
#  ORGANIZATION: Skillbox, Drone Programming
#       CREATED: 12.05.2024 09:57:23
#      REVISION:  ---
#===============================================================================

set -euxo pipefail  #~/.vim/plugged/bash-support/bash-support/templates/Templates:str68

DAYS_OLD=7
DISK_THRESHOLD=20
LOG_FILE="deletion_log.txt"

while true; do
  dir=$(df -k | awk 'NR>1 {print $6}' | fzf)
  
  disk_free=$(df -k "$dir" | awk 'NR==2 {print $4}')
  disk_total=$(df -k "$dir" | awk 'NR==2 {print $2}')
  disk_pct=$((100 * disk_free / disk_total))
  
  if [ "$disk_pct" -lt "$DISK_THRESHOLD" ]; then
    find "$dir" -type f -mtime +$DAYS_OLD -exec rm {} \;
    echo "$(date): Удалены файлы старше $DAYS_OLD дней в $dir" >> "$LOG_FILE"
    echo "Очистка $dir завершена. Свободно $disk_pct%"
  else
    echo "Свободного места на $dir достаточно ($disk_pct%)"
  fi
  
  read -p "Очистить другой каталог? [y/N] " choice
  case "$choice" in 
    y|Y ) continue ;;
    * ) break ;;
  esac
done

