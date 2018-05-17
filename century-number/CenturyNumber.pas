program CenturyNumber;

function Input(): Integer;
begin
  result := 0;
  repeat
    Write('Введите номер года -> ');
    ReadLn(result);
    if result <= 0 then
      WriteLn('Ошибка! Введите целое положительное число.');
  until result > 0;
end;

function GetCentury(year: Integer): Integer;
begin
  result := year div 100;
  if year mod 100 <> 0 then
    Inc(result);
end;

var
  year: Integer;  // номер года.
  сentury: Integer;  // номер столетия.
begin
  year := Input();
  сentury := GetCentury(year);
  WriteLn('Соответствующий ' + year + ' году номер столетия: ' + сentury);
end.
