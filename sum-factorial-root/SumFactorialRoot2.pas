program SumFactorialRoot2;

// Функция для вычисления корня k-й степени из числа A с точностью precision:
function KthRoot(A, precision: Real; k: Integer): Real;
var
   x_p, X: Real;
begin
   x_p := Sqrt(A);
   while Abs(A - Power(x_p, k)) > precision do
   begin
      x := (1 / k) * (((k - 1) * x_p) + (A / (Power(x_p, k - 1))));
      x_p := x;
   end;
   result := x_p;
end;

var
  n, k, one, f1, f2: Integer;
  x, s: Real;
begin
  repeat
    Write('n -> ');
    ReadLn(n);
  until n >= 2;
  
  Write('x -> ');
  ReadLn(x);
  
  s := 0;

  one := -1;
  f1 := 1;
  f2 := 1 * 2 * 3;
  for k := 2 to n do begin
    one := one * (-1);
    f1 := f1 * k;
    f2 := f2 * (2 * k) * (2 * k + 1);
    s := s + one * (f1 / f2) * KthRoot(x * x, 0.0000000001, k);
  end;
  
  WriteLn('s = ', s);
end.