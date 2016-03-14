number   = ARGV.first
alphabet = ('a'..'z').to_a.join
numbers  = "22233344455566677778889999"

puts IO.read("/usr/share/dict/words")
       .downcase
       .split
       .select { |word| word.tr(alphabet, numbers) == number }
