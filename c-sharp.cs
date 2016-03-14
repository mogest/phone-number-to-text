using System;
using System.IO;
using System.Text;
using System.Linq;

class PhoneNumberToWords
{
    public string Number;
    public string[] Words;
    const string LetterMapping = "22233344455566677778889999";
    
    public PhoneNumberToWords(string number, string dictionaryFile)
    {
        Number = number;
        Words = System.IO.File.ReadAllLines(dictionaryFile);
    }
    
    public void OutputMatchingWords()
    {
        Words.Where(word => WordMatchesNumber(word))
             .ToList()
             .ForEach(word => Console.WriteLine(word));
    }
    
    private bool WordMatchesNumber(string word)
    {
        return WordToNumber(word) == Number;
    }
    
    private string WordToNumber(string word)
    {
        StringBuilder builder = new StringBuilder(@"");
        
        foreach (char c in word.ToUpper())
        {
            if (c >= 65 && c < 65 + 26)
            {
                builder.Append(LetterMapping[c - 65]);
            }
            else
            {
                builder.Append(c);
            }
        }
        
        return builder.ToString();
    }
    
    static void Main(string[] args)
    {
        String number = args[0];

        new PhoneNumberToWords(number, @"/usr/share/dict/words").OutputMatchingWords();
    }
}
