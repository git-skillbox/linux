#!/bin/bash -
#===============================================================================
#
#          FILE: file_creator.sh
#
#         USAGE: ./file_creator.sh
#
#   DESCRIPTION: скрипт создает файлы в заданном пользователем каталоге с параметрическим
#                вводом характеристик, проверкой ошибок и их логированием 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: можно было заморочиться с интерактивным выбором каталога с использованием
#                fzf, но это бы выглядело не так олдскульно :)
#
#        AUTHOR: Oleg Sokolov (+7 918 200 111 7), os-sochi@mail.ru
#  ORGANIZATION: Skillbox, Drone Programming
#       CREATED: 11.05.2024 14:39:04
#      REVISION:  ---
#===============================================================================

set -euxo pipefail  #~/.vim/plugged/bash-support/bash-support/templates/Templates:str68

# Функция для создания файлов в заданном каталоге
create_files() {
    local target_dir=$2  # Передаём путь к каталогу как параметр функции
    for (( i=1; i<=count; i++ ))
    do
        local file_path="${target_dir}/file${i}.dat"
        # Команда dd с проверкой на ошибку и перенаправлением вывода
        if ! dd if=/dev/zero of="$file_path" bs=1M count=$1 > /dev/null 2>&1; then
            echo "Ошибка при создании файла ${file_path}" | tee -a creation_log.txt
        else
            echo "Создан файл ${file_path} размером $1 мегабайт" | tee -a creation_log.txt
        fi
    done
}

# Функция для запроса данных у пользователя и вызова функции создания файлов
prompt_user() {
    read -p "Введите размер файла в мегабайтах: " size
    read -p "Введите количество файлов: " count
    read -p "Введите название целевого каталога: " target_dir
    if ! [[ "$size" =~ ^[0-9]+$ ]] || ! [[ "$count" =~ ^[0-9]+$ ]]; then
        echo "Ошибка: введите положительные числа." | tee -a creation_log.txt
        exit 1
    fi
    if [ ! -d "$target_dir" ]; then  # Проверка на существование каталога
        echo "Каталог '$target_dir' не существует. Создайте каталог и повторите попытку." | tee -a creation_log.txt
        exit 1
    fi
    echo "Начало создания файлов $(date)" | tee creation_log.txt
    create_files $size $target_dir
    echo "Файлы успешно созданы $(date)" | tee -a creation_log.txt
}

prompt_user


