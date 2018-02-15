program Array2D;

// Функция для ввода данных:
function input(): Integer;
begin
  write('Введите размер массива ');
  readln(Result);
  //Result := 5;  // DEBUG
end;

// Функция инициализации двумерного массива:
function init(N: Integer): array of array of Integer;
var
  i, j: Integer;
begin
  // Выделяем память под двумерный массив:
  SetLength(Result, N);
  for i := 1 to N do
    SetLength(Result[i - 1], N);
  
  // Заполняем массив нулям:
  for i := 0 to N - 1 do begin
    for j := 0 to N - 1 do begin
      Result[i][j] := 0;
    end;
  end;
end;

// Процедура для вывода результатов:
procedure output(arr: array of array of Integer; N: Integer);
var
  i, j: Integer;
begin
  writeln('Вывод результатов расчетов на экран: ');
  for i := 0 to N - 1 do begin
    for j := 0 to N - 1 do begin
      write(arr[i][j]:3);
    end;
    writeln;
  end;
end;

// Процедура заполнения массива:
procedure fill(var arr: array of array of Integer; N: Integer);
var
  i, j, cnt, row, col, len: Integer;
  turn: Boolean;
begin
  cnt := 1;
  i := 1;
  turn := FALSE;
  while TRUE do begin
    if i <= N then begin
      len := i;
      row := i - 1;
      col := 0;
    end else begin
      len := N - (i - N);
      row := N - 1;
      col := i - N;
    end;
    // write('|', len, '|: ');  // DEBUG
    for j := 1 to len do begin
      // write('(', row, '; ', col, ') ');  // DEBUG
      if turn then
        arr[row][col] := cnt + len - j
      else begin
        arr[row][col] := cnt;
        inc(cnt);
      end;
      dec(row); inc(col);
    end;
    //writeln;  // DEBUG
    inc(i);
    
    if turn then cnt := cnt + len;
    turn := not turn;
    
    if i = 2 * N then
      break;
  end;
end;

var
  N: Integer;
  arr: array of array of Integer;
  choice: Char;

begin
  writeln('Назначением данного консольного приложения является вывод двумерного массива.');
  while TRUE do begin
  
    // Программа разбита на отдельные подзадачи:
    N := input();  // ввод данных.
    arr := init(N);  // создание двумерного массива.
    fill(arr, N);  // заполнение массива по определенному алгоритму.
    output(arr, N);  // вывод данных.
    
    // Программа завершается запросом на повтор расчетов:
    write('Для повтора введие Да или да. Повторить? ');
    readln(choice);
    if (choice <> 'Д') and (choice <> 'д') then
      break;
      
  end;
  
end.
