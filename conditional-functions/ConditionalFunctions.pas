program ConditionalFunctions;

function y1(x: Integer; var y: Integer): Boolean;
begin
  if x = 5 then begin
    Result := TRUE;
    y := 3 * x + 1
  end else if x = -5 then begin
    Result := TRUE;
    y := 1 - x;
  end else
    Result := FALSE;
    
  if Result then
    WriteLn('y1(', x, ') = ', y)
  else
    WriteLn('y1(', x, ') = нет ответа');
end;

function y2(x: Integer): Integer;
begin
  if x > 100 then
    Result := 5
  else if x = 100 then
    Result := 0
  else  // if x < 100 then
    Result := 4;
  
  WriteLn('y2(', x, ') = ', Result);
end;

function y3(a: Integer; b: Integer; c: Integer): Integer;  // минимум:
begin
  if a < b then
    if a < c then
      Result := a
    else if b < c then  // a >= b и c >= a
      Result := b
    else
      Result := c
  else if b < c then  // a >= b
    Result := b
  else
    Result := c;

  WriteLn('y3(', a, ', ', b ,', ', c, ') = ', Result);
end;

var
  x, y: Integer;
begin

  y1(5, y);
  y1(-5, y);
  y1(0, y);
  
  WriteLn;
  
  y2(200);
  y2(100);
  y2(50);
  
  WriteLn;
  
  y3(1, 2, 3);
  y3(1, 3, 2);
  y3(2, 1, 3);
  y3(2, 3, 1);
  y3(3, 1, 2);
  y3(3, 2, 1);

end.