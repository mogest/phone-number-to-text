#include <stdio.h>
#include <ctype.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/stat.h>

char *read_file(void)
{
    int fd;
    struct stat stat;
    char *words;

    fd = open("/usr/share/dict/words", O_RDONLY);
    if (fd == -1) { return NULL; }

    if (fstat(fd, &stat) == -1) { return NULL; }

    words = (char *)malloc(stat.st_size + 1);
    if (words == NULL) { return NULL; }

    if (read(fd, words, stat.st_size) != stat.st_size) { return NULL; }
    close(fd);

    words[stat.st_size] = 0;

    return words;
}

int main(int argc, char *argv[])
{
    const char *numbers = "22233344455566677778889999";
    char *words, *word_ptr, *start_word_ptr;
    char *number, *number_ptr;
    int letter_index;

    if (argc != 2) { return 1; }

    number = argv[1];
    words = read_file();
    if (words == NULL) { return 1; }

    word_ptr = words;
    start_word_ptr = words;
    number_ptr = number;

    while (*word_ptr) {
        letter_index = toupper(*word_ptr) - 65;
        if (letter_index >= 0 && letter_index < 26 && numbers[letter_index] == *number_ptr) {
            number_ptr++;
            word_ptr++;

            if (*number_ptr == 0 && *word_ptr == '\n') {
                *word_ptr = 0;
                puts(start_word_ptr);
                start_word_ptr = ++word_ptr;
                number_ptr = number;
            }
        }
        else {
            while (*word_ptr != '\n') { word_ptr++; }
            start_word_ptr = ++word_ptr;
            number_ptr = number;
        }
    }

    free(words);
    return 0;
}
