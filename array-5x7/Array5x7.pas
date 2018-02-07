program Array5x7;

const
  ROWS = 5;
  COLS = 7;
  FILE_NAME = 'Суммы.txt';
  
type
  MyArray = array[1..ROWS, 1..COLS] of Integer;  // тип целочисленного массива размером 5*7.

// Процедура определения сумм положительных и отрицательных элементов заданной строки матрицы:
procedure RowSum(A: MyArray; row: Integer; f: Text);
var
  col, sumpos, sumneg: Integer;
  str: String;
begin  
  sumpos := 0;
  sumneg := 0;
  
  for col := 1 to COLS do begin  // строка уже задана в аргементе процедуры, поэтому идём только по столбцам:
    if (A[row][col] < 0) then
      sumneg := sumneg + A[row][col]  // подсчет суммы отрицательных элементов.
    else
      sumpos := sumpos + A[row][col];  // подсчет суммы положительных элементов.
  end;
  
  str := Concat(' Cумма положительных элементов ', IntToStr(row), '-й строки матрицы = ', IntToStr(sumpos), '.');
  WriteLn(str);  // вывод на экран.
  WriteLn(f, str);  // вывод в файл.
  
  str := Concat(' Cумма отрицательных элементов ', IntToStr(row), '-й строки матрицы = ', IntToStr(sumneg), '.');
  WriteLn(str);  // вывод на экран.
  WriteLn(f, str);  // вывод в файл.
  
end;

// Процедура нахождения суммы положительных и отрицательных элементов каждой строки матрицы:
procedure AllRowsSum(A: MyArray; f: Text);
var
  row: Integer;
  str: String;
begin
  str := 'Cуммы положительных и отрицательных элементов строки матрицы: ';
  WriteLn(str);  // вывод на экран.
  WriteLn(f, str);  // вывод в файл.
  
  // Для каждой строки матрицы вызываем процедуру определения суммы положительных и отрицательных элементов:
  for row := 1 to ROWS do begin
    RowSum(A, row, f)    
  end;
end;

// НАЧАЛО ПРОГРАММЫ:

var
  row, col, num: Integer;  // вспомогательные переменные.
  A: MyArray;  // двумерный массив А размером ROWS*COLS.
  myfile: Text;  // файловый дескриптор.
begin
  WriteLn('Элементы двумерного массива А размером ', ROWS, '*', COLS, ' сформированного с помощью генератора случайных чисел: ');
  
  // Формирование двумерного массива А с помощью генератора случайных чисел и вывод элементов массива на экран:
  for row := 1 to ROWS do begin  // идём по строкам...
    for col := 1 to COLS do begin  // идём по столбцам...
      
      // Генерация случайного числа:
      num := Random(10);  // диапазон = [0; 10).
      if Random(2) = 0 then  // генерация случайного знака, 0 - плюс, 1 - минус.
        A[row][col] := num  // число будет положительным.
      else
        A[row][col] := -num;  // число будет отрицательным.
        
      Write(A[row][col]:4);  // вывод элемента массива на экран.
    end;
    WriteLn;
  end;
  
  WriteLn;
  
  // Открываем чистый файл для записи:
  Assign(myfile, FILE_NAME);
  Rewrite(myfile);
  
  AllRowsSum(A, myfile);  // вызов процедуры определения сумм положительных и отрицательных элементов строк матрицы.
  
  Close(myfile);  // закрыть файл.
end.