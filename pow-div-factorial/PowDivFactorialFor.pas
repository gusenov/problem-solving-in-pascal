program PowDivFactorialRepeatUntil;

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
  sum := numerator / denominator;
  
  for i := 2 to 7 do begin
  
    numerator := numerator * x * x;
    denominator := denominator * (2 * i - 1) * (2 * i - 2);

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
    
  end;
  
  WriteLn('Ответ: ', sum);
  
end.
