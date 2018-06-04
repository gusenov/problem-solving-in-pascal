program SumFactorialRoot;

var
  n, k, one, f1, f2: Integer;
  x, x2, s, kroot, kroot_p: Real;
begin
  repeat
    Write('n -> ');
    ReadLn(n);
  until n >= 2;
  
  Write('x -> ');
  ReadLn(x);
  
  x2 := x * x;  // x в квадрате.
  kroot_p := Sqrt(x2);

  s := 0;

  one := -1;  // при k=1, (-1)^k равно -1.
  f1 := 1;  // при k=1, k!=1.
  f2 := 1 * 2 * 3;  // при k=1, (2k+1)! = (2*1+1)! = 3! = 1*2*3 = 6.
  
  for k := 2 to n do begin
    one := one * (-1);  // (-1)^k.
    f1 := f1 * k;  // k!.
    f2 := f2 * (2 * k) * (2 * k + 1);  // (2k+1)!.
    
    // k-й корень из x^2:
    while Abs(x2 - Power(kroot_p, k)) > 0.0000000001 do begin
      kroot := (1 / k) * (((k - 1) * kroot_p) + (x2 / (Power(kroot_p, k - 1))));
      kroot_p := kroot;
    end;
    
    // Сумма:
    s := s + one * (f1 / f2) * kroot_p;
  end;
  
  WriteLn('s = ', s);
end.