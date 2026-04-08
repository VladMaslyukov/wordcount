#include <stdio.h>
#include <string.h>
#include <ctype.h>

#define MAX_LENGTH 1000

int count_words(const char *str) {
    int count = 0;
    int in_word = 0;

    for (int i = 0; str[i] != '\0'; i++) {
        if (!isspace(str[i]) && in_word == 0) {
            in_word = 1;
            count++;
        } else if (isspace(str[i])) {
            in_word = 0;
        }
    }
    return count;
}

int main() {
    char input[MAX_LENGTH];

    printf("Введите строку (до %d символов):\n", MAX_LENGTH - 1);

    if (fgets(input, MAX_LENGTH, stdin) == NULL) {
        printf("0\n");
        return 1;
    }

    size_t len = strlen(input);
    if (len > 0 && input[len - 1] == '\n') {
        input[len - 1] = '\0';
    }

    int result = count_words(input);
    printf("Количество слов: %d\n", result);

    return 0;
}

