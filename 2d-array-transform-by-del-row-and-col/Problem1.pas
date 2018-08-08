// Задача 1.
program Problem1;

const
  LenA = 6;  // размер стороны квадратной матрицы A.
  LenB = LenA - 1;  // размер стороны квадратной матрицы B.

type
  RangeA = 1..LenA;
  ArrayA = array [RangeA, RangeA] of Boolean;  // тип матрицы A.
  RangeB = 1..LenB;
  ArrayB = array [RangeB, RangeB] of Boolean;  // тип матрицы B.

// Процедура для случайного заполнения массива булевыми значениями:
procedure RandomFill(var A: ArrayA);
var 
  i, j: RangeA;
begin
  for i := 1 to LenA do begin
    for j := 1 to LenA do begin
      // Тут случайно генерируется число в диапазоне [0, 1).
      if Random >= 0.5 then  // если число больше-равно 0.5, то:
        A[i][j] := TRUE  // записываем в очередной элемента массива ИСТИНУ,
      else  // иначе:
        A[i][j] := FALSE;  // записываем в очередной элемента массива ЛОЖЬ,
    end;
  end;
end;

// Процедура для ввода n-ой строки и k-го столбца:
procedure Input(var n, k: RangeA);
begin
  Write('n-ая строка - > ');
  ReadLn(n);
  
  Write('k-ый столбец -> ');
  ReadLn(k);
end;

// Процедура для получения массива B из массива A 
// удалением n-ой строки и k-го столбца:
procedure Transform(A: ArrayA; var B: ArrayB; n, k: RangeA);
var
  i, j: RangeA;
  skiprow, skipcol: Boolean;
begin
  skiprow := FALSE;
  skipcol := FALSE;
  
  for i := 1 to LenA do begin
    
    if i = n then begin
      skiprow := TRUE;
      continue;
    end;
    
    for j := 1 to LenA do begin
      
      if j = k then begin
        skipcol := TRUE;
        continue;
      end;

      if skiprow and skipcol then
        B[i - 1][j - 1] := A[i][j]
      else if skipcol then
        B[i][j - 1] := A[i][j]
      else if skiprow then
        B[i - 1][j] := A[i][j]
      else
        B[i][j] := A[i][j];
    end;  // j
    
    skipcol := FALSE;
  
  end;  // i

end;

// Вывод на экран матрицы A:
procedure Output(A: ArrayA);
var 
  i, j: RangeA;
begin
  for i := 1 to LenA do begin
    for j := 1 to LenA do begin
      Write(A[i][j]:10, ' ');
    end;
    WriteLn;
  end;
end;

// Вывод на экран матрицы B:
procedure Output(B: ArrayB);
var 
  i, j: RangeB;
begin
  for i := 1 to LenB do begin
    for j := 1 to LenB do begin
      Write(B[i][j]:10, ' ');
    end;
    WriteLn;
  end;
end;


var
  A: ArrayA;
  B: ArrayB;
  n, k: RangeA; 
  
begin

  WriteLn('Массив A:');
  RandomFill(A);
  Output(A);
  WriteLn;

  WriteLn('Получение массива B из массива A удалением n-ой строки и k-го столбца:');
  Input(n, k);
  WriteLn;
  
  Transform(A, B, n, k);
  
  WriteLn('Массив B:');
  Output(B);
  WriteLn;
  
end.
