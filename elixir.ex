defmodule NumberToText do
  @dictionary_file "/usr/share/dict/words"

  def search(number) do
    File.read!(@dictionary_file)
    |> String.downcase
    |> String.split
    |> Enum.filter(fn word -> text_to_number(word) == number end)
  end

  defp text_to_number(text) do
    text
    |> String.graphemes
    |> Enum.map(&translate_letter/1)
    |> Enum.join
  end

  defp translate_letter(text) do
    cond do
      text <= "c" -> "2"
      text <= "f" -> "3"
      text <= "i" -> "4"
      text <= "l" -> "5"
      text <= "o" -> "6"
      text <= "s" -> "7"
      text <= "v" -> "8"
      true        -> "9"
    end
  end
end

System.argv
|> hd
|> NumberToText.search
|> IO.inspect
