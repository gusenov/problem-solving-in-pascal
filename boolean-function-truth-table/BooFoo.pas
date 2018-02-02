program BooFoo;

// Функция для преобразования целого числа в бинарную строку:
function IntToBinStr(number: Integer): String;
var
  i, half: Integer;
begin
  Result := '';
  for i := 1 to number do begin
    half := number div 2;
    Result := IntToStr(number - half * 2) + Result;
    number := half;
    if half = 0 then break;
  end;
end;

const
  FIELD_WIDTH = 10;  // длина поля для вывода элементов матрицы.

var
  n, i, j: Integer;
  f, b: String;

begin
  WriteLn('ВХОДНЫЕ ДАННЫЕ');
  WriteLn('Введите строку содержащую векторную запись булевой функции:');
  ReadLn(f);
  
  n := Length(IntToBinStr(Length(f) - 1));  // количество аргументов булевой функции.
  
  WriteLn;
  WriteLn('ВЫХОДНЫЕ ДАННЫЕ');
  
  WriteLn('Матрица:');
  
  // Вывод заголовка матрицы:
  for i := 1 to n do begin
    Write(Concat('x[', IntToStr(i), ']') : FIELD_WIDTH);
  end;
  WriteLn('f' : FIELD_WIDTH);
  
  // Вывод строк:
  for i := 0 to Length(f) - 1 do begin
    b := IntToBinStr(i);  // получаем очередной набор аргументов булевой функции по номеру i.
    
    // Вывод нулей в начале записи числа:
    for j := 1 to n - Length(b) do begin
      Write('0' : FIELD_WIDTH);
    end;
    
    // Вывод аргументов булевой функции из полученного набора:
    for j := 1 to Length(b) do begin
      Write(b[j] : FIELD_WIDTH);
    end;
    
    WriteLn(f[i + 1] : FIELD_WIDTH);  // вывод значения булевой функции.
  end;

end.
