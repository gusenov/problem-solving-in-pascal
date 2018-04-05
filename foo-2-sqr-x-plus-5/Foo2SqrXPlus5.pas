program Foo2SqrXPlus5;

var
  x: Real;
begin

  WriteLn('Используя while:');
  x := -3;
  while x <= 1 do begin
    WriteLn('x=', x, ' y=', 2 * Sqr(x) + 5);
    x := x + 0.1;
  end;

  WriteLn;

  WriteLn('Используя repeat:');
  x := -3;
  repeat
    WriteLn('x=', x, ' y=', 2 * Sqr(x) + 5);
    x := x + 0.1;
  until x >= 1;
  
end.