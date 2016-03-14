import sys
import string

NUMBER = sys.argv[1]
ALPHABET = string.ascii_lowercase
NUMBERS = '22233344455566677778889999'
WORD_LIST_PATH = '/usr/share/dict/words'
WORD_TO_NUMBER = str.maketrans(ALPHABET, NUMBERS)


def words_matching_phone_number(word_list, number):
    def matches_number(word):
        return word.translate(WORD_TO_NUMBER) == number

    words_lower_and_stripped = (word.lower().strip() for word in word_list)

    return (word for word in words_lower_and_stripped if matches_number(word))


with open(WORD_LIST_PATH, 'r') as word_list:
    print('\n'.join(words_matching_phone_number(word_list, NUMBER)))
