program ProductOnePlusSinDivFactorial;

procedure Input(var n: Integer; var x: Real);
begin
  Write('n -> ');
  ReadLn(n);
  
  Write('x -> ');
  ReadLn(x);
end;

function Product(n: Integer; x: Real): Real;
var
  k, f: Integer;
begin
  result := 1;
  f := 1;
  for k := 1 to n do begin
    f := f * k;
    result := result * (1 + sin(k * x) / f);
  end;
end;

var
  n: Integer;
  x: Real;

begin
  Input(n, x);  
  WriteLn('P = ', Product(n, x));
end.
