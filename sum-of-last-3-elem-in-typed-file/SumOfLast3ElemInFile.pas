program SumOfLast3ElemInFile;

Type fr = file of real;

function InputFileName(): fr;
var
  fname: String;
begin
  Write('Введите наименование файла -> ');
  ReadLn(fname);
  Assign(Result, fname);
end;

function InputNumberOfElem(): Integer;
begin
  Write('Введите количество элементов в файле -> ');
  ReadLn(Result);
end;

procedure CreateRandomTypedFile(f: fr; cnt: Integer);
var
  i: Integer;
  num: Real;
begin
  Rewrite(f);
  
  WriteLn('Случайно сгенерированные вещественные числа для записи в Real типизированный файл:');
  for i := 1 to cnt - 1 do begin
    num := Random({Диапазон: word});  // если параметр Диапазон не указан, то возвращает случайное число X, которое удовлетворяет условию 0 <= X < 1.
    Write(num:5:2);
    Write(f, num);
  end;
  
  WriteLn(' 0');
  Write(f, 0);  // последний элемент = 0.
  
  Close(f);
end;

procedure CreateAndInputTypedFile(f: fr);
var
  i: Integer;
  num: Real;
begin
  Rewrite(f);
  
  WriteLn('Введите вещественные числа (последний элемент = 0):');
  i := 0;
  repeat
    ReadLn(num);
    Write(f, num);
    inc(i);
  until (num = 0) and (i >= 3);
  
  Close(f);
end;

// Функция s3(f), значением которой является сумма последних трёх элементов файла f, 
// имеющего тип fr и содержащего не менее 3 элементов.
function s3(f: fr): Real;
var
  num: Real;
  sz: Integer;
begin
  Reset(f);
  sz := FileSize(f);
  
  WriteLn('Количество вещественных чисел в файле = ', sz);
  if sz < 3 then begin
    WriteLn('Ошибка! Файл должен содержать не менее 3 вещественных чисел!');
    Result := 0;
    exit;
  end;
  
  // Узнать количество элементов типизированного файла (размер файла) можно с помощью функции FileSize.
  if sz >= 3 then begin
    // Элементы типизированного файла нумеруются с нуля
    // (порядковый номер последнего элемента файла на единицу меньше размера файла).
    // Текущим положением указателя можно управлять, для чего служит процедура Seek.
    Seek(f, sz - 3);
    
    Result := 0;
    while not Eof(f) do begin
      Read(f, num);
      Write(num:5:2);
      if FilePos(f) = sz then
        Write(' = ')
      else
        Write(' + ');
      Result += num;
    end;
    WriteLn(Result:5:2);
    
  end;
  
  Close(f);
end;

var
  choice: Char;
begin
  WriteLn('Меню:');
  WriteLn(' 1) Создать случайный Real типизированный файл.');
  WriteLn(' 2) Создать и ввести элементы Real типизированного файла.');
  WriteLn(' 3) Вычислить сумму последних трех элементов Real типизированного файла.');
  WriteLn(' 4) Выход.');  
  while TRUE do begin
    Write('Введите номер пункта меню -> ');
    ReadLn(choice);
    case choice of
      '1': CreateRandomTypedFile(InputFileName(), InputNumberOfElem());
      '2': CreateAndInputTypedFile(InputFileName());
      '3': s3(InputFileName());
      '4': break;
    end;
  end;
end.
