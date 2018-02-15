program NonCongruentTriangles;

// Функция инициализации двумерного массива:
function Init2DBooleanArray(N: Integer): array of array of Boolean;
var
  i, j: Integer;
begin
  // Выделяем память под двумерный массив:
  SetLength(Result, N);
  for i := 1 to N do
    SetLength(Result[i - 1], N);
  
  // Заполняем массив значениями FALSE:
  for i := 0 to N - 1 do begin
    for j := 0 to N - 1 do begin
      Result[i][j] := FALSE;
    end;
  end;
end;

procedure Search(N: Integer);
var
  a, b, c: Integer;
  row, col: Integer;
  i, j: Integer;
  used: array of array of Boolean;
  mult: Boolean;
begin
  
  used := Init2DBooleanArray(N);
  
  // Перебираем все
  for a := 1 to N do begin  // катеты
    for b := 1 to N do begin
      for c := 1 to N do begin  // и гипотенузы.

        // Проверяем проходили ли уже текущую комбинацию катетов,
        // а также проверяем является ли треугольник прямоугольным.
        row := a - 1; col := b - 1;
        if (not used[row][col]) and (not used[col][row])
          and ((Power(a, 2) + Power(b, 2)) = Power(c, 2)) then begin
          
            // Проверка кратных катетов:
            mult := FALSE;
            for i := 1 to N do begin
              if mult then break;
              for j := 1 to N do begin
                if (a mod i = 0) and (b mod j = 0)
                    and (used[i-1][j-1] or used[j-1][i-1]) then begin
                      mult := TRUE;
                      break;
                end;
              end;
            end;
          
            if not mult then begin
              writeln('a = ', a, ' b = ', b, ' c = ', c);
              used[row][col] := TRUE;
              used[col][row] := TRUE;
            end;
            
        end;
        
      end;
    end;
  end;
end;

// Функция для получения данных от пользователя.
function Input(): Integer;
begin
  Write('Введите N: ');
  ReadLn(Result);
end;

var
  choice: Char;
begin
  writeln('Назначением данной программы состоит в поиске неподобных прямоугольных треугольников.');
  while TRUE do begin
    Search(Input());
  
    // Программа завершается запросом на повтор расчетов:
    write('Для повтора введие Да или да. Повторить? ');
    readln(choice);
    if (choice <> 'Д') and (choice <> 'д') then
      break;
      
  end;

end.
