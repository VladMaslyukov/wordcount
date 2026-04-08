# Используем ту же версию Ubuntu, что и ваша виртуальная машина
# Узнать версию можно командой: lsb_release -a
FROM ubuntu:22.04

# Отключаем интерактивные запросы при установке пакетов
ENV DEBIAN_FRONTEND=noninteractive

# Копируем .deb пакет из артефакта в образ
COPY wordcount-1.0.deb /tmp/

# Устанавливаем пакет и необходимые зависимости
RUN apt-get update && \
    apt-get install -y /tmp/wordcount-1.0.deb && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*

# Запускаем программу с тестовой строкой
# Входные данные передаём через echo
CMD echo "hello my world" | wordcount
