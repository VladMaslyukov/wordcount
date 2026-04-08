#!/bin/bash
echo "Начинаю сборку программы..."

cd src
make

if [ -f "./wordcount" ]; then
    mkdir -p ../usr/bin
    cp wordcount ../usr/bin/
    echo "Сборка успешна. Бинарный файл в usr/bin/"
    exit 0
else
    echo "Ошибка сборки"
    exit 1
fi
