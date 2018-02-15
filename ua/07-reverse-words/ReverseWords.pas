program ReverseWords;

// Функция изменяет порядок символов в строке на обратный.
function ReverseWord(w: String): String;
var
  i, j, middle, len: Integer;
  ch: Char;
begin
  len := Length(w);
  middle := len div 2;
  for i := 1 to middle do begin
    ch := w[i];
    j := len - i + 1;
    w[i] := w[j];
    w[j] := ch;
  end;
  Result := w;
end;

// Процедура изменяет порядок символов в слове из предложения на обратный.
procedure ReverseWordInSentence(var s: String; b: Integer; e: Integer);
var
  i, j, middle, len: Integer;
  ch: Char;
begin
  len := e - b + 1;
  middle := len div 2;
  for i := b to b + middle - 1 do begin
    ch := s[i];
    j := e - i + b;
    s[i] := s[j];
    s[j] := ch;
    // writeln(i, '<->', j);  // DEBUG
  end;
end;

// Процедура изменяет порядок всех слов из предложения на обратный.
function ReverseSentence(s: String): String;
var
  i, j: Integer;
begin
  j := -1;
  for i := 1 to Length(s) do begin    
    
    // Разделители слов в предложении:
    if     (s[i] = ' ')
        or (s[i] = ',')
        or (s[i] = '!') 
        or (s[i] = '?') 
        or (s[i] = '.')
        
        or (i = Length(s)) then begin        
        
          if j <> -1 then begin
            //writeln('[', j, '; ', i - 1, ']');  // DEBUG
            ReverseWordInSentence(s, j, i - 1);
          end;
          j := -1;
          continue
          
    end else
    
      if j = -1 then begin
        j := i;
      end;

  end;
  
  Result := s;
end;

function Input(): String;
begin
  ReadLn(Result);
end;

var
  myString: String;
  choice: Char;
begin
  writeln('Назначением данной программы изменять порядок слов в предложении на обратный.');
  while TRUE do begin
    writeln('Введите предложение: ');
    myString := Input();
    //myString := ' Hello, World! Programming is fun!';  // DEBUG
    WriteLn(ReverseSentence(myString));
    
    // Программа завершается запросом на повтор расчетов:
    write('Для повтора введие Да или да. Повторить? ');
    readln(choice);
    if (choice <> 'Д') and (choice <> 'д') then
      break;
      
  end;
  
end.
