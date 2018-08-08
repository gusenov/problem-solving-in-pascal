program AllUpperCaseVowelsInString;

const
  VOWELS_STR = 'AEIOU';  // строка больших латинских гласных букв.

var
  str: String;  // входная строка.
  letters, answer: set of Char;
  i: Integer;

begin
  
  WriteLn('Ввведите строку:');
  ReadLn(str);
  
  // Добавление символов входной строки в множество:
  for i := 1 to Length(str) do
    Include(letters, str[i]);
  
  // Пересечение множества больших латинских гласных букв
  // с множеством символов входной строки:
  answer := ['A', 'E', 'I', 'O', 'U'] * letters;
  
  // Вывод результирующего множества в алфавитном порядке:
  for i := 1 to Length(VOWELS_STR) do
    if VOWELS_STR[i] in answer then
      WriteLn(VOWELS_STR[i]);
  
end.
