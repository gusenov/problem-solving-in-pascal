program SortFileWithRealNum;

const
  F_NAME = 'real-numbers.dat';  // имя типизированного файла.
  G_NAME = 'real-numbers.txt';  // имя текстового файла.
  NUM_CNT = 10;  // количество чисел в файле.
  MAX_VAL = 100;  // макс. значение по модулю.

var
  f: File of Real;
  g: Text;
  i, j: Integer;
  numbers: Array of Real;
  x: Real;

begin

  // Создание файла f компонентами которого являются действительные числа:
  Assign(f, F_NAME);
  Rewrite(f);
  for i := 1 to NUM_CNT do begin
    if Random(2) = 0 then  // генерация случайного знака, 0 - плюс, 1 - минус.
      // Число будет положительным:
      x := Random(MAX_VAL)  // диапазон = [0; MAX).
    else
      // Число будет отрицательным:
      x := -Random(MAX_VAL);  // диапазон = [0; MAX).
    
    x := x / (Random(10) + 1);  // получаем вещественное число.
    
    Write(f, x);
  end;
  Close(f);
  
  //Чтение файла f компонентами которого являются действительные числа:
  Assign(f, F_NAME);
  Reset(f);
  SetLength(numbers, FileSize(f));
  i := 0;
  while not Eof(f) do begin
    Read(f, numbers[i]);
    // Write(x, ' ');  // DEBUG.
    Inc(i);
  end;
  Close(f);
  
  // Сортировка:
  for i := Length(numbers) - 1 downto 1 do begin
    for j := 0 to i do begin
      if (Abs(numbers[j]) < Abs(numbers[i])) then begin
        x := numbers[i];
        numbers[i] := numbers[j];
        numbers[j] := x;
      end;
    end;
  end;
  
  // Создание текстового файла g, 
  // в котором эти числа через пробел расположены в порядке убывания модулей:
  Assign(g, G_NAME);
  Rewrite(g);
  for i := 0 to Length(numbers) - 1 do begin
    Write(g, numbers[i], ' ');
  end;
  Close(g);
  
end.
