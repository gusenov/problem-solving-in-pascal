program Reverse_order; 

var 
  n, c, m, k: Integer;

begin 
  write('Введите число: '); 
  readln(n); 

  m := n div 10;
  k := 1;
  while m > 0 do begin
    m := m div 10;
    k := k * 10;
  end;
  
  m := 0;
  while n > 0 do begin
    c := n mod 10;
    n := n div 10;
    m := c * k + m;
    k := k div 10;
  end;
  
  writeln('Число, полученное выписыванием в обратном порядке цифр заданного числа - это число ', m);
end.
