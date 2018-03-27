program ColSum;

const
  WIDTH = 5;

// Функция инициализации двумерного массива:
function Init(n: Integer; m: Integer): array of array of Integer;
var
  i, j: Integer;
begin
  // Выделяем память под двумерный массив:
  SetLength(Result, n);
  for i := 1 to n do
    SetLength(Result[i - 1], m);
  
  // Заполняем матрицу с помощью генератора случайных чисел:
  for i := 0 to n - 1 do begin
    for j := 0 to m - 1 do begin
      Result[i][j] := Random(10);  // диапазон = [0; 10).
    end;
  end;
end;

// Процедура для вывода результатов:
procedure Output(A: array of array of Integer; n: Integer; m: Integer);
var
  i, j: Integer;
begin
  for i := 0 to n - 1 do begin
    for j := 0 to m - 1 do begin
      Write(A[i][j]:WIDTH);
    end;
    WriteLn;
  end;
end;

// Процедура определения суммы элементов каждого столбца левой половины и сумму элементов каждого четного столбца правой половины матрицы A.
procedure CalcSum(A: array of array of Integer; n: Integer; m: Integer);
var
  row, col, sum: Integer;
begin
  WriteLn('Сумма элементов:');
  for col := 0 to m - 1 do begin
    sum := 0;
    for row := 0 to n - 1 do begin
      sum := sum + A[row][col];
    end;
    if col < m div 2 then begin
      // WriteLn('Сумма элементов ', col + 1, ' столбца из левой половины = ', sum);
      Write(sum:WIDTH);
    end else if (col + 1) mod 2 = 0 then begin
      // WriteLn('Сумма элементов ', col + 1, ' (четного) столбца из правой половины = ', sum);
      Write(sum:WIDTH);
    end else begin
      Write('':WIDTH);
    end;
  end;
end;

var
  n, m: Integer;
  A: array of array of Integer;

begin
  repeat
    Write('Введите размеры матрицы N x M (M кратно 4) -> ');
    ReadLn(n, m);
  until m mod 4 = 0;
  
  A := Init(n, m);  // создание двумерного массива.
  
  WriteLn('Вывод исходной матрицы на экран:');
  Output(A, n, m);
  
  CalcSum(A, n, m);

end.