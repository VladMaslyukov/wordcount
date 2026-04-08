#!/bin/bash
echo "Создание deb-пакета"

cat > DEBIAN/control << EOF
Package: wordcount
Version: 1.0
Section: utils
Priority: optional
Architecture: amd64
Maintainer: Student <vlad.maslyukov.04@gmail.com>
Description: Word count program
 Reads a string and outputs number of words
EOF

if [ ! -f "./usr/bin/wordcount" ]; then
    echo "Ошибка: бинарный файл не найден"
    exit 1
fi

dpkg-deb --build . wordcount-1.0.deb

if [ -f "./wordcount-1.0.deb" ]; then
    echo "Пакет создан: wordcount-1.0.deb"
    exit 0
else
    echo "Ошибка создания пакета"
    exit 1
fi
