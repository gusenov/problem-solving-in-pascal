program ProductOnePlusSinDivFactorial;

var
  n, k, f: Integer;
  x, p: Real;

begin
  Write('n -> ');
  ReadLn(n);
  
  Write('x -> ');
  ReadLn(x);
  
  p := 1;
  f := 1;
  for k := 1 to n do begin
    f := f * k;
    p := p * (1 + sin(k * x) / f);
  end;
  
  WriteLn('P = ', p);

end.
