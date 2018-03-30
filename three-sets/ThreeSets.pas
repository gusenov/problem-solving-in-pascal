program ThreeSets;

const
  MAX = 100;

type
  MySet = set of 1..MAX;  // тип множества, содержащего целые числа из диапазона 1...100.

// Функция для генерации случайного множества заданной мощности:
function BuildRandomSet(cnt: Integer): MySet;
var
  i: Integer;  // счётчик.
  num: Integer;  // случайное число.
begin
  result := [];
  for i := 1 to cnt do begin
    repeat
      num := Random(100) + 1;  // диапазон = [1; 100].
    until not (num in result);
    Include(result, num);
  end;
end;

// Функция для вывода множества на экран:
procedure PrintSet(s: MySet);
var
  i: Integer;  // счётчик.
begin
  for i := 1 to MAX do begin
    if i in s then begin
      Write(i, ' ')
    end;
  end;
  WriteLn;
end;

var
  i: Integer;  // счётчик.
  X1, X2, X3: MySet;  // три множества, содержащие целые числа из диапазона 1...100.
  Y: MySet;  // результирующее множество.
  
begin
  // Исходные множества:
  
  X1 := BuildRandomSet(10);  // мощность множества X1 равна 10.
  Write('X1 = '); PrintSet(X1);
  
  X2 := BuildRandomSet(10);  // мощность множества X2 равна 10.
  Write('X2 = '); PrintSet(X2);
  
  X3 := BuildRandomSet(10);  // мощность множества X3 равна 10.
  Write('X3 = '); PrintSet(X3);
  
  
  // Промежуточные множества:
  
  Write('X1 + X2 = '); PrintSet(X1 + X2);
  Write('X2 * X3 = '); PrintSet(X2 * X3);
  
  
  // Результирующее множество:
  
  Y := (X1 + X2) + (X2 * X3);
  Write('Y = (X1 + X2) + (X2 * X3) = '); PrintSet(Y);
end.