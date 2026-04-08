#!/bin/bash
echo "Запуск тестов..."

PROG="./usr/bin/wordcount"

if [ ! -f "$PROG" ]; then
    echo "Ошибка: программа не найдена"
    exit 1
fi

chmod +x "$PROG"

run_test() {
    input="$1"
    expected="$2"
    name="$3"

    result=$(echo -n "$input" | "$PROG" 2>/dev/null | grep "Количество слов:" | sed 's/.*: //')

    if [ "$result" = "$expected" ]; then
        echo "Пройден: $name"
        return 0
    else
        echo "Не пройден: $name (ожидалось $expected, получено $result)"
        return 1
    fi
}

failed=0

run_test "hello my world" "3" "Три слова" || ((failed++))
run_test "hello" "1" "Одно слово" || ((failed++))
run_test "   hello world   " "2" "Пробелы вокруг" || ((failed++))
run_test "one two three four five" "5" "Пять слов" || ((failed++))

if [ $failed -eq 0 ]; then
    echo "Все тесты пройдены"
    exit 0
else
    echo "Не пройдено тестов: $failed"
    exit 1
fi
