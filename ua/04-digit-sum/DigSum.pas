program DigSum;

// Структура данных представляющая пользовательский ввод.
type InputData = record
  N: Integer;  // натуральное число.
  
  // Диапазон для значений К:
  a: Integer;
  b: Integer;
end;

// Функция для подсчета цифр числа.
function SumOfDigits(n: Integer): Integer;
begin
  Result := 0;
  while n <> 0 do begin
    Result := Result + n mod 10;
    n := n div 10;
  end;
end;

// Процедура поиска делителей суммы цифр натурального числа.
procedure Search(myData: InputData);
var
  i, s: Integer;
begin
  s := SumOfDigits(myData.N);
  writeln('Сумма цифр числа ', myData.N, ' составляет ', s, '.');
  for i := myData.a to myData.b do begin
    if s mod i = 0 then
      writeln('K = ', i, '; ', s, ' / ', i, ' = ', s div i, '.');
  end;
end;

// Функция для получения данных от пользователя.
function Input(): InputData;
begin
  Result.N := 0;
  while Result.N <= 0 do begin
    write('Введите натуральное число: ');
    readln(Result.N);
  end;
  
  Result.a := 0; Result.b := 0;
  while (Result.a <= 0) or (Result.b <= 0) or (Result.a > Result.b) do begin
    writeln('Введите натуральный диапазон (a < b) для поиска делителей суммы цифр натурального числа: ');
    readln(Result.a, Result.b);
  end;
end;

var 
  myData: InputData;
  choice: Char;
begin
  writeln('Назначением данной программы состоит в поиске делителей суммы цифр натурального числа.');
  while TRUE do begin
    myData := Input();
    Search(myData);  // запуск поиска делителей.
  
    // Программа завершается запросом на повтор расчетов:
    write('Для повтора введие Да или да. Повторить? ');
    readln(choice);
    if (choice <> 'Д') and (choice <> 'д') then
      break;
      
  end;
end.