#include <string>
#include <vector>
#include <map>
#include <fstream>
#include <algorithm>
#include <iostream>
#include <iterator>

std::string wordToNumber(const std::string& word, const std::map<char, char>& letterToNumberMap) {
	std::string stringToReturn;
	std::transform(word.begin(), word.end(), std::back_inserter(stringToReturn),
		[&](char ch) { return letterToNumberMap.at(ch); });
	return stringToReturn;
}

int main(int argc, char* argv[]) {
	if (argc < 2) return 1;

	std::fstream file("wordlist.txt");
	std::vector<std::string> words;
	std::string fileReadStr;
	std::string inputNumber = argv[1];
	const char* numbers = "22233344455566677778889999";
	std::map<char, char> letterToNumberMap;

	while (std::getline(file, fileReadStr)) {
		std::transform(fileReadStr.begin(), fileReadStr.end(), fileReadStr.begin(), tolower);
		words.push_back(fileReadStr);
	}

	for (int i = 0; i < 26; i++) {
		letterToNumberMap.insert(std::make_pair(i + 'a', numbers[i]));
	}

	for (auto& word : words) {
		if (inputNumber == wordToNumber(word, letterToNumberMap)) {
			std::cout << word << "\n";
		}
	}
}
