<?php
  $number = $argv[1];
  $data = file_get_contents("/usr/share/dict/words");

  $words = explode("\n", strtolower($data));
  $alphabet = range('a', 'z');
  $numbers = array(2, 2, 2, 3, 3, 3, 4, 4, 4, 5, 5, 5, 6, 6, 6, 7, 7, 7, 7, 8, 8, 8, 9, 9, 9, 9);

  function wordToNumber($word) {
    global $alphabet, $numbers;

    return str_replace($alphabet, $numbers, $word);
  }

  function wordMatchesNumber($word) {
    global $number;

    return $number == wordToNumber($word);
  }

  $matchingWords = array_filter($words, "wordMatchesNumber");

  foreach ($matchingWords as $word) {
    echo "$word\n";
  }
?>
