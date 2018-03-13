program SumOfPairAsSymmetricalNumber;

// Процедура ввода данных:
procedure InputInterval(var a: Integer; var b: Integer);
begin
  Write('Введите отрезок [a,b] -> ');
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

// Функция для определения симметричности числа:
function IsSymmetric(num: Integer): Boolean;
var
  t: Integer;
  len: Integer;  // количество цифр в числе.
  ldig, rdig: Integer;  // цифры слева и справа в числе.
begin
  result := TRUE;
  len := NumberLength(num);  // количество цифр в числе.
  
  while len > 1 do begin
  
    // Извлечение цифры справа:
    rdig := num mod 10;  // цифра справа в числе.
    num := num div 10;  // удаление извлеченной цифры из исходного числа.
    dec(len);  // длина числа уменьшилась на единицу.
    // WriteLn('rdig=', rdig, ' num=', num, ' len=', len);
    
    // Извлечение цифры слева:
    t := Pow(10, len - 1);
    ldig := num div t;  // цифра слева в числе.
    num := num - ldig * t;  // удаление извлеченной цифры из исходного числа.
    dec(len);  // длина числа уменьшилась на единицу.
    // WriteLn('t=', t, ' ldig=', ldig, ' num=', num, ' len=', len);
    // WriteLn;
    
    if ldig <> rdig then begin  // если цифры слева и справа не равны:
      result := FALSE;  // то это не симметричное число.
      break;
    end;
  end;

end;

// Процедура поиска на отрезке [a,b] всех пар соседних чисел, сумма которых образует симметричное число:
procedure SearchPairs(a: Integer; b: Integer);
var
  i, sum: Integer;
begin
  WriteLn('Поиск...');
  for i := a + 1 to b do begin
    sum := (i - 1) + i;
    if IsSymmetric(sum) and (sum > 9) then begin
      WriteLn('Сумма соседних чисел ', (i - 1), ' и ', i, ' образует симметричное число ', sum, '.');
    end;
  end;
end;

var
  a, b: Integer;
begin
  WriteLn('Данная программа предназначена для поиска на отрезке [a,b] всех пар соседних чисел, сумма которых образует симметричное число.');
  InputInterval(a, b);  // ввод границ отрезка.
  // WriteLn('a=', a, ' b=', b);
  SearchPairs(a, b);  // поиск на отрезке [a,b] всех пар соседних чисел, сумма которых образует симметричное число.
end.
