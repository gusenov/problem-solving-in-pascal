program ReverseOrderOfNumericRows;

// Процедура для ввода значений параметров таблицы:
procedure InputTable(var rows: Integer; var cols: Integer);
begin
  Write('Введите количество строк и столбцов в таблице -> ');
  ReadLn(rows, cols);
end;

// Альтернативная процедура для вывода таблицы на экран:
procedure PrintTable2(rows: Integer; cols: Integer);
var
  i, even, half: Integer;
begin
  even := rows + 1;
  half := rows div 2;
  for i := rows downto 1 do begin
    if i mod 2 = 0 then begin
      WriteLn(even);
      dec(even);
    end else begin
      dec(half);
      WriteLn(i - half);
    end;
  end;
end;

// Процедура для вывода таблицы на экран:
procedure PrintTable(rows: Integer; cols: Integer);
var
  i, j, k, odd, even: Integer;
begin
  odd := rows + 1;
  k := 0;
  for i := 1 to rows do begin
    
    k := k + (i mod 2);
    
    if i mod 2 <> 0 then begin
      for j := 1 to k do begin
        Write(odd, ' ');
      end;    
    
    end else begin
      for j := 1 to k do begin
        Write(odd - cols, ' ');
      end;
      dec(odd);
    end;
    
    if i = (rows div 2) + 1 then inc(k);
    
    WriteLn;
  end;
end;

var
  rows, cols: Integer;
begin
  //InputTable(rows, cols);  // ввод исходных данных.
  rows := 8; cols := 5;
  PrintTable(rows, cols); // вывод результирующей таблицы на экран.
end.
