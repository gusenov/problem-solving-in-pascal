program SortArrayByDesc;

// Функция для генерации случайного массива длины len:
function BuildRandomArray(len: Integer; max: Integer): array of Integer;
var
  i: Integer;  // счётчик.
begin
  SetLength(result, len);
  
  // Заполнение массива с помощью генератора случайных чисел:
  for i := 0 to len - 1 do begin
    if Random(2) = 0 then  // генерация случайного знака, 0 - плюс, 1 - минус.
      // Число будет положительным:
      result[i] := Random(max)  // диапазон = [0; max).
    else
      // Число будет отрицательным:
      result[i] := -Random(max);  // диапазон = [0; max).
  end;
end;

// Процедура для вывода массива на экран:
procedure PrintArray(arr: array of Integer; n: Integer);
var
  i: Integer;
begin
  for i := 0 to n - 1 do begin
    Write(arr[i]);
    if i <> n - 1 then
      Write(', ')
  end;
  WriteLn;
end;

// Процедура для сортировки массива по убыванию:
procedure SortArray(var arr: array of Integer; n: Integer);
var
  i, j: Integer;  // счётчики.
  max: Integer;
  t: Integer;
begin
  for i := 0 to n - 1 do begin
    max := i;
    for j := max + 1 to n - 1 do begin
      if arr[j] > arr[max] then begin
        t := arr[j];
        arr[j] := arr[max];
        arr[max] := t;
      end;
    end;
  end;
end;

var
  arr: array of Integer;
  n: Integer;
  m: Integer;

begin
  Write('Введите длину массива и макс. значение для генерации элементов в дипазоне [0; max) -> ');
  ReadLn(n, m);
  
  arr := BuildRandomArray(n, m);
  
  WriteLn('Исходный массив:');
  PrintArray(arr, n);
  
  SortArray(arr, n);
  
  WriteLn('Отсортированный массив:');
  PrintArray(arr, n);
end.