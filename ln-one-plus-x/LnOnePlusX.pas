program LnOnePlusX;

function Ln1Plus(x: Real; e: Real): Real;
var
  numerator: Real;  // числитель.
  n: Integer;  // знаменатель; номер по порядку.
  previous: Real;  // предыдущая сумма ряда.
begin
  
  numerator := x;
  n := 0;
  result := numerator / (n + 1);
  
  repeat    
    previous := result;  // WriteLn('previous = ', previous);

    Inc(n);  // WriteLn('n = ', n);
    numerator := numerator * x;
    if n mod 2 <> 0 then begin
      result := result - numerator / (n + 1);
    end else begin
      result := result + numerator / (n + 1);
    end;
    // WriteLn('result = ', result);
    
  until Abs(result - previous) < e;
end;

var
  x, e: Real;
  
begin
  Write('Введите x (-1 < x ≤ 1) и e (0 < e < 0.001) -> ');
  ReadLn(x, e);
  
  // x := 0.5; e := 0.0009;  // DEBUG.
  // x := 0.8; e := 0.0001;  // DEBUG.
  
  WriteLn('ln(1 + ', x, ') = ', Ln1Plus(x, e));
end.
