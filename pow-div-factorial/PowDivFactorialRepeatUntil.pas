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
  
  i := 1; 
  
  repeat

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
    
  until i > 7;  // повторять до тех пор пока i не станет больше 7.
  
  WriteLn('Ответ: ', sum);
  
end.
