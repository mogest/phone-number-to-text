// Written by the Powershop mobile dev team

import Foundation

func loadDictionary() throws -> [String] {
    do {
        let path = "/usr/share/dict/words"
        let fileContents = try NSString(contentsOfFile: path, encoding: NSUTF8StringEncoding)
        words = fileContents.lowercaseString.componentsSeparatedByString("\n")
        return words
    }
}

func wordToNumber(word: String) -> String {
    let letters: [String] = Array("abcdefghijklmnopqrstuvwxyz".characters)
    let numbers: [Int] = [2, 2, 2, 3, 3, 3, 4, 4, 4, 5, 5, 5, 6, 6, 6, 7, 7, 7, 7, 8, 8, 8, 9, 9, 9, 9]
    for i in 0..<letters.count {
        word = word.stringByReplacingOccurrencesOfString(letters[i], withString: String(numbers[i]))
    }
    return word
}

func findMatchingNumbers(targetNumber: String, words: [String]) -> [String] {
    filteredWords = words.filter { (word) -> Bool in
        let number = wordToNumber(word)
        return number == targetNumber
    }
    return filteredWords
}

if let number = Process.arguments.first {
    do {
        let words = try loadDictionary()
        let matches = findMatchingNumbers(number, words)
        for word in matches {
            print(word)
        }
    } catch {
        print("An error occured loading the dictionary.")
    }
}
