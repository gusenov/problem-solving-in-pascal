program RecursiveSumOfElemInTypedFile;

type
  reals = file of real;

function InputFileName(): reals;
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

procedure CreateRandomTypedFile(f: reals; cnt: Integer);
var
  i: Integer;
  num: Real;
begin
  Rewrite(f);
  WriteLn('Случайно сгенерированные вещественные числа для записи в Real типизированный файл:');
  for i := 1 to cnt do begin
    num := Random({Диапазон: word});  // если параметр Диапазон не указан, то возвращает случайное число X, которое удовлетворяет условию 0 <= X < 1.
    Write(num:5:2);
    Write(f, num);
  end;
  WriteLn;
  Close(f);
end;

procedure CreateAndInputTypedFile(f: reals; cnt: Integer);
var
  i: Integer;
  num: Real;
begin
  Rewrite(f);
  WriteLn('Введите ', cnt, ' вещественных чисел:');
  for i := 1 to cnt do begin
    ReadLn(num);
    Write(f, num);
  end;
  Close(f);
end;


function sum(var f: reals; n: Real): Real;
var
  num, pow: Real;
begin
  if not Eof(f) then begin
    Read(f, num);
    pow := Power(num, n);
    
    Write(pow:5:2);
    if FilePos(f) = FileSize(f) then
      Write(' = ')
    else
      Write(' +');
    
    Result += pow + sum(f, n);
  end else
    Result := 0;
end;

var
  choice: Char;
  f: reals;
  n: Real;
begin
  WriteLn('Меню:');
  WriteLn(' 1) Создать случайный Real типизированный файл.');
  WriteLn(' 2) Создать и ввести элементы Real типизированного файла.');
  WriteLn(' 3) Вычислить сумму a[i]^n всех элементов Real типизированного файла.');
  WriteLn(' 4) Выход.');  
  while TRUE do begin
    Write('Введите номер пункта меню -> ');
    ReadLn(choice);
    case choice of
      '1': CreateRandomTypedFile(InputFileName(), InputNumberOfElem());
      '2': CreateAndInputTypedFile(InputFileName(), InputNumberOfElem());
      '3': begin
              f := InputFileName();
              Reset(f);
              Write('Введите n -> ');
              ReadLn(n);
              WriteLn(sum(f, n):5:2);  // сумма a[i]^n всех элементов.
              Close(f);
           end;
      '4': break;
    end;
  end;
end.

