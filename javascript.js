function dictionaryLoaded(err, data) {
  if (err) {
    return console.log(err);
  }

  var number  = process.argv[2];
  var words   = data.toLowerCase().split("\n");
  var matches = findMatchingNumbers(number, words);
  console.log(matches);
}

function wordToNumber(word) {
  return word
    .replace(/[a-c]/g, '2')
    .replace(/[d-f]/g, '3')
    .replace(/[g-i]/g, '4')
    .replace(/[j-l]/g, '5')
    .replace(/[m-o]/g, '6')
    .replace(/[p-s]/g, '7')
    .replace(/[t-v]/g, '8')
    .replace(/[w-z]/g, '9');
}

function findMatchingNumbers(targetNumber, words) {
  return words.filter(function(word) {
    return wordToNumber(word) === targetNumber;
  });
}

var fs = require('fs');
fs.readFile("/usr/share/dict/words", 'utf8', dictionaryLoaded);
