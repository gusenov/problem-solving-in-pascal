program MaxHighestDigitOfTwoNumbers;

// Процедура ввода данных:
procedure InputTwoNumbers(var a: Integer; var b: Integer);
begin
  Write('Введите два натуральных числа a и b -> ');
  ReadLn(a, b);
end;

// Функция для определения количества цифр в числе:
function NumberLength(num: Integer): Integer;
begin
  result := 0;
  while num > 0 do begin
    inc(result);
    num := num div 10;
  end;
end;

// Функция для возведения числа в степень:
function Pow(num: Integer; e: Integer): Integer;
begin
  if e = 0 then begin
    result := 1;
  end else begin
    result := 1;
    while e > 0 do begin
      result := result * num;
      dec(e);
    end;
  end;
end;

// Функция для извлечения старшей цифры из числа:
function ExtractHighestDig(var num: Integer): Integer;
var
  len, t: Integer;
begin
  len := NumberLength(num);  // количество цифр в числе;
  t := Pow(10, len - 1);
  result := num div t;  // старшая цифра в числе.
  num := num - result * t;  // удаление старшей цифры из исходного числа.
end;

// Функция для определения наибольшей цифры из старших заданных цифр заданных чисел:
function GetMaxDigOfHighest(a: Integer; b: Integer): Integer;
var
  adig, bdig: Integer;
begin  
  adig := ExtractHighestDig(a);  // старшая цифра в числе a.
  bdig := ExtractHighestDig(b);  // старшая цифра в числе b.
  if adig > bdig then
    result := adig
  else
    result := bdig;
end;

var
  a, b: Integer;
begin
  InputTwoNumbers(a, b);
  WriteLn('Наибольшая цифра из старших заданных цифр заданных чисел = ', GetMaxDigOfHighest(a, b));
end.
