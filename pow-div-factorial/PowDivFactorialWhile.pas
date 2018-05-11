program PowDivFactorialWhile;

var

  x: Real;  // дано x.
  numerator: Real;  // числитель.
  denominator: Real;  // знаменатель.
  i: Integer;  // счётчик итераций.
  sum: Real;  // сумма.

begin

  Write('Введите x -> ');
  ReadLn(x);
  
  numerator := x;
  denominator := 1;
  
  i := 1; 
  
  while i <= 7 do begin

    if i mod 2 <> 0 then begin
      (* ОТЛАДКА:
      WriteLn('Числитель элемента № ', i, ' = +', numerator);
      WriteLn('Знаменатель элемента № ', i, ' = ', denominator);
      WriteLn('Элемент № ', i, ' = +', numerator / denominator);
      WriteLn;
      *)
      
      sum := sum + numerator / denominator;
      
    end else begin
      (* ОТЛАДКА:
      WriteLn('Числитель элемента № ', i, ' = -', numerator);
      WriteLn('Знаменатель элемента № ', i, ' = ', denominator);
      WriteLn('Элемент № ', i, ' = -', numerator / denominator);
      WriteLn;
      *)
      
      sum := sum - numerator / denominator;
      
    end;

    Inc(i);
      
    numerator := numerator * x * x;
    denominator := denominator * (2 * i - 1) * (2 * i - 2);
    
  end;
  
  WriteLn('Ответ: ', sum);
  
end.
