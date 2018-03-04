program MatColSwap;

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
      Write(A[i][j]:3);
    end;
    WriteLn;
  end;
end;

// Процедура перестановки столбцов: первого с последним, второго с предпоследним и т.д.
procedure Swap(A: array of array of Integer; n: Integer; m: Integer);
var
  i, j: Integer;
begin
  for i := 0 to n - 1 do begin
    for j := 0 to (m - 1) div 2 do begin
      
      // Обмен при помощи исключающего ИЛИ (https://ru.wikipedia.org/wiki/Алгоритм_обмена_при_помощи_исключающего_ИЛИ):
      
      if A[i][j] <> A[i][m - 1 - j] then begin
        
          A[i][j] := A[i][j] xor A[i][m - 1 - j];
          
          A[i][m - 1 - j] := A[i][m - 1 - j] xor A[i][j];
          
          A[i][j] := A[i][j] xor A[i][m - 1 - j];
        
      end;
      
    end;
  end;
end;

var
  n, m: Integer;
  A: array of array of Integer;

begin
  Write('Введите размеры матрицы -> ');
  ReadLn(n, m);
  
  A := Init(n, m);  // создание двумерного массива.
  
  WriteLn('Вывод исходной матрицы на экран:');
  Output(A, n, m);
  
  Swap(A, n, m);
  
  WriteLn('Вывод обработанной матрицы на экран:');
  Output(A, n, m);
end.
