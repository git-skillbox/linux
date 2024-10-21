___
# Виртуализация и контейнеризация
___
## Задание
Для выполнения практической работы следуйте алгоритму, описанному ниже.

1. Установка Docker и Docker Compose:
    - Установите Docker и Docker Compose на вашу систему.
    - Настройте Docker для работы без прав root (добавление пользователя в группу docker).
2. Разработка простой программы:
    - Напишите простую программу на Python или Bash. Например, программа может выполнять простую симуляцию робота или даже выводить текущее время и дату или простое приветствие.
    - Создайте репозиторий на GitHub для вашего проекта.
3. Создание Docker-образа для программы:
    - Создайте Dockerfile для сборки образа, включающего вашу программу и зависимости.
    - Соберите Docker-образ из вашего Dockerfile.
4. Запуск и тестирование Python-приложения в Docker-контейнере:
    - Запустите Docker-контейнер из созданного образа.
    - Проверьте, что ваша программа работает корректно внутри контейнера.
5. Работа с Docker Compose:
    - Создайте docker-compose.yml, который запускает ваш Docker-контейнер с программой.
    - Добавьте комментарии в docker-compose.yml, объясняющие его структуру и команды.
    - Убедитесь, что Docker Compose позволяет запустить ваш контейнер.
6. Оформление проекта на GitHub:
    - Поместите ваш Dockerfile и docker-compose.yml в репозиторий на GitHub.
    - Подготовьте README.md, описывающий ваш проект и процесс запуска программы с помощью Docker и Docker Compose.

**Примечание:** в контексте этого задания docker-compose.yml может быть использован для определения и запуска одного контейнера с приложением. Цель использования Docker Compose здесь — попробовать более удобный и структурированный способ запуска контейнера, особенно если в будущем планируется расширение проекта. Например, можно легко добавить дополнительные сервисы или настроить сетевые параметры. В этом примере docker-compose.yml будет содержать минимальные настройки, необходимые для запуска контейнера с вашим приложением.

## В качестве решения представьте:

    - ссылку на ваш GitHub-репозиторий (или его архив), содержащий Dockerfile, docker-compose.yml, README.md и ваше тестовое приложение с комментариями, объясняющими каждую инструкцию;
    - скриншоты, демонстрирующие успешный запуск и работу вашей программы в Docker-контейнере;
описание шагов по установке и настройке Docker и Docker Compose.

## Что оценивается;
    - Правильность составления и функционирования Dockerfile.
    - Ясность и полнота README.md.
    - Успешность запуска приложения с помощью Docker Compose.
    - Работоспособность приложения в Docker-контейнере (представлены подтверждения, например скриншоты вывода скрипта).
    - Документация процесса создания образа и работы с контейнером.

___
___
# Модуль пройден
* Все задания выполнены. 
* Процесс выполнения оформлен в [документальном виде](https://github.com/git-skillbox/linux/blob/module4/module4-pw.pdf).
* Созданный код приложен к настоящей ветке репозитория.
___
