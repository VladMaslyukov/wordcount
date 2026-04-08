#!/bin/bash
echo "Создание deb-пакета"

PACKAGE_NAME="wordcount"
VERSION="1.0"

# Проверяем, что бинарный файл существует
if [ ! -f "./usr/bin/wordcount" ]; then
    echo "Ошибка: бинарный файл не найден в ./usr/bin/wordcount"
    exit 1
fi

# Устанавливаем права на выполнение
chmod +x ./usr/bin/wordcount
echo "Права на выполнение добавлены"

# Создаём control файл
cat > DEBIAN/control << EOF
Package: ${PACKAGE_NAME}
Version: ${VERSION}
Section: utils
Priority: optional
Architecture: amd64
Maintainer: Student Name <student@email.com>
Description: Word count program
 Reads a string and outputs the number of words
EOF

# Собираем пакет
dpkg-deb --build . ${PACKAGE_NAME}-${VERSION}.deb

if [ -f "./${PACKAGE_NAME}-${VERSION}.deb" ]; then
    echo "Пакет создан: ${PACKAGE_NAME}-${VERSION}.deb"
else
    echo "Ошибка: пакет не создан"
    exit 1
fi
