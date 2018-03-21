program SumOfFactorials;

// Функция для ввода входных данных:
function Input(): Integer;
begin
  Write('Введите натуральное число n -> ');
  ReadLn(result);
end;

// Рекурсивная функция для вычисления факториала:
function Factorial(n: Integer): Integer;
begin
  if n = 0 then
    result := 1
  else
    result := n * Factorial(n - 1);
end;

// Функция для вычисления суммы:
function S(n: Integer; isOutput: Boolean): Integer;
var
  i: Integer;
begin
  result := 0;
  for i := 1 to n do begin
    if i mod 2 <> 0 then begin
      result := result + Factorial(i);
      
      // Вывод очередного элемента на экран:
      if isOutput then
        if i = 1 then
          Write(i, '!')
        else
          Write(' + ', i, '!')

    end else begin
      result := result - Factorial(i);
      
      if isOutput then
        Write(' - ', i, '!');  // вывод очередного элемента на экран.
      
    end
  end;
  
end;

var
  n: Integer;
begin
  n := Input();
  Write('S = ');
  
  WriteLn(' = ', S(n, TRUE));  // выводить элементы последовательности.
  //WriteLn(S(n, FALSE));  // не выводить элементы последовательности.
end.
