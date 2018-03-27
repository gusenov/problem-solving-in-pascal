program AltSumOfDigs;

function ReverseNumber(n: Integer): Integer;
var c, m, k: Integer;
begin
  m := n div 10;
  k := 1;
  while m > 0 do begin
    m := m div 10;
    k := k * 10;
  end;
  
  result := 0;
  while n > 0 do begin
    c := n mod 10;
    n := n div 10;
    result := c * k + result;
    k := k div 10;
  end;
end;

var
  n: Integer;
  reversed: Integer;
  dig: Integer;
  sum: Integer;
  cnt: Integer;
begin
  Write('Введите натуральное число n -> ');
  ReadLn(n);
  
  reversed := ReverseNumber(n);
  WriteLn('Число с обратным порядком цифр: ', reversed);
  
  dig := reversed mod 10;
  sum := dig;
  Write(dig);
  reversed := reversed div 10;
  cnt := 1;
  
  while reversed > 0 do begin
    dig := reversed mod 10;
    
    if cnt mod 2 <> 0 then begin
      sum := sum - dig;
      Write(' - ', dig);
    end else begin
      sum := sum + dig;
      Write(' + ', dig);
    end;
    
    reversed := reversed div 10;
    Inc(cnt);
  end;
  
  Write(' = ', sum);

end.