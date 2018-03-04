program DelLastPosGroup;

var
  n, i, right, left: Integer;
  A: array of Integer;
  
begin
  Write('Введите размер массива -> ');
  ReadLn(n);
  // n := 10;  // DEBUG.
  SetLength(A, n);
  
  // DEBUG:
  // A[0] := -2; A[1] := 6; A[2] := 6; A[3] := -3; A[4] := -8; A[5] := -1; A[6] := -1; A[7] := 8; A[8] := -2; A[9] := -3;
  
  WriteLn('Вывод исходного массива:');
  
  // Заполнение исходного массива с помощью генератора случайных чисел:
  for i := 0 to n - 1 do begin
    if Random(2) = 0 then  // генерация случайного знака, 0 - плюс, 1 - минус.
      // Число будет положительным:
      A[i] := Random(10)  // диапазон = [0; 10).
    else
      // Число будет отрицательным:
      A[i] := -Random(10);  // диапазон = [0; 10).
    Write(A[i], ' ');
  end;
  WriteLn();
  
  right := -1;
  left := -1;
  for i := n - 1 downto 0 do begin
    // Примечание: число 0 не является ни положительным, ни отрицательным.
    if (right = -1) and (A[i] > 0) then
        right := i;
    if right <> -1 then
        if (A[i] <= 0) then
            if right - i >= 2 then begin
                left := i + 1;
                break;
            end else
                right := -1
        else if i = 0 then
            left := 0;
  end;
  
  if (right - left + 1) >= 2 then begin
      WriteLn('Последняя группа положительных элементов находится в диапазоне zero-based индексов [', left, '; ', right, '].');
      
      for i := right + 1 to n - 1 do begin
        // WriteLn('A[', left + (i - right + 1), '] = A[', i, '];');  // DEBUG.
        A[left + (i - (right + 1))] := A[i];
      end;
      
      n := n - (right - left + 1);
      WriteLn('Новая длина массива = ', n);
      SetLength(A, n);
  end else
      WriteLn('В массиве нет групп положительных элементов нет!');
  
  WriteLn('Вывод обработанного массива:');
  for i := 0 to n - 1 do begin
    Write(A[i], ' ');
  end;
  WriteLn();
  
end.
