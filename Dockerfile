FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

COPY wordcount-1.0.deb /tmp/

RUN apt-get update && \
    apt-get install -y /tmp/wordcount-1.0.deb && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*

# Диагностика: найти где установлена программа
RUN find / -name "wordcount" 2>/dev/null || echo "wordcount not found"

# Посмотреть содержимое /usr/bin
RUN ls -la /usr/bin/ | head -20

CMD echo "hello my world" | wordcount
