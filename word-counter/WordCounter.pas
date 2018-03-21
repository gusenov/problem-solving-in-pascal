program WordCounter;

// Функция для ввода данных:
function Input(): array of String;
var
  i, N: Integer;
begin
  Write('Введите количество строк -> ');
  ReadLn(N);
  SetLength(result, N);
  for i := 0 to N - 1 do begin
    Write('Введите строку № ', i + 1, ' -> ');
    ReadLn(result[i]);
  end;
end;

// Функция, подсчитывающая количество слов в строке:
function CountWordsInString(str: String): Integer;
var
  a: Integer;  // индекс символа являющегося началом слова.
  b: Integer;  // индекс символа являющегося окончанием слова.
begin
  result := 0;
  
  a := -1;
  for b := 1 to Length(str) do begin    
    
    // Разделители слов в предложении:
    if     (str[b] = ' ')
        or (str[b] = ',')
        or (str[b] = '!') 
        or (str[b] = '?') 
        or (str[b] = '.')
        
        or (b = Length(str)) then begin        
        
          if a <> -1 then begin
            inc(result);
          end;
          a := -1;
          continue
          
    end else
    
      if a = -1 then begin
        a := b;
      end;

  end;

end;

var
  i: Integer;
  strings: array of String;
begin
  strings := Input();
  
  WriteLn('Количество слов в строке');
  for i := 0 to Length(strings) - 1 do begin
    WriteLn(' № ', i + 1, ' = ', CountWordsInString(strings[i]));
  end;
end.
