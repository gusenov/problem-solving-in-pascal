program FindWordsWithVowels;

var
  i, j, n, vowels, consonants: Integer;
  words: array of String;
  allvowels: set of Char;

begin
  WriteLn('Введите количество слов в массиве -> ');
  ReadLn(n);
  SetLength(words, n);
  for i := 0 to n - 1 do begin
    Write('Введите ', i + 1, '-е слово -> ');
    ReadLn(words[i]);
  end;
  
  allvowels := ['A', 'E', 'I', 'O', 'U', 'Y'];
  // Буква 'Y' может быть гласной и согласной и передавать гласные и согласные звуки.
  
  WriteLn('Слова у которых число гласных букв превышает число согласных: ');
  
  for i := 0 to n - 1 do begin
    vowels := 0;  // количество гласных в слове.
    consonants := 0;  // количество согласных в слове.
    for j := 1 to Length(words[i]) do begin
      if UpperCase(words[i][j]) in allvowels then
          if (UpperCase(words[i][j]) = 'Y') then
              // Если 'Y' стоит в середине или в конце слова, то 'Y' обозначает гласный звук.
              if j > 1 then
                  inc(vowels)
              else
                  inc(consonants)
          else
              inc(vowels)
      else
          inc(consonants);
    end;
    if vowels > consonants then
      WriteLn('В слове "', words[i], '" количество гласных букв (', vowels, ') превышает число согласных (', consonants, ').');
  end;
  
end.