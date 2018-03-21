program ReplaceDatesInMessage;

// Функция для ввода входных данных:
function Input(): String;
begin
  Write('Задайте строку s -> ');
  ReadLn(result);
end;

// Функция для проверки, является ли символ цифрой:
function isDig(ch: Char): Boolean;
begin
  if (ch >= '0') and (ch <= '9') then
    result := TRUE
  else
    result := FALSE;
end;

// Функция для перевода символа представляющего цифру в число:
function DigCharToNum(ch: Char): Integer;
begin
  result := -1;
  if isDig(ch) then
    result := Ord(ch) - Ord('0');
end;

// Функция для подсчёта количества точек в строке:
function dotsCount(s: String): Integer;
var
  i: Integer;
begin
  result := 0;
  for i := 1 to Length(s) do begin
    if s[i] = '.' then begin
      Inc(result);
    end;
  end;
end;

// Функция для проверки является ли строка датой:
function isDate(s: String): Boolean;
var
  i, j: Integer;
  d, m, y: Integer;
  dig, ten, num: Integer;
begin
  result := TRUE;
  
  if dotsCount(s) <> 2 then begin
    result := FALSE;
    Exit;
  end;
  
  i := Length(s);

  d := 0; m := 0; y := 0;
  
  for j := 3 downto 1 do begin
    ten := 1;
    while (i > 0) and (s[i] <> '.') do begin
      dig := DigCharToNum(s[i]);
      if dig = -1 then begin
        result := FALSE;
        Exit;
      end;
      num := dig * ten;
      case j of 
        3: y := y + num;
        2: m := m + num;
        1: d := d + num;
      end;
      ten := ten * 10;
      Dec(i);
    end;
    if (i > 0) and (s[i] = '.') then Dec(i);
  end;
  
  // WriteLn('d=', d, ' m=', m, ' y=', y);
  
  if (d < 1) or (d > 31) or (m < 1) or (m > 12) or (y < 1) or (y > 2020) then begin
    result := FALSE;
    Exit;
  end;
  
end;

// Функция для проверки является ли год високосным:
function IsLeapYear(year: Integer): Boolean;
begin
  if year mod 400 = 0 then begin result := TRUE; Exit; end;
  if year mod 100 = 0 then begin result := FALSE; Exit; end;
  result := (year mod 4) = 0;
end;

// Функция для добавления дней к дате:
function AddDaysToDate(s: String; days: Integer): String;
const
  DAYS_PER_MONTH: array[1..12] of Integer = ( 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 );
var
  i, j: Integer;
  d, m, y: Integer;
  dig, ten, num: Integer;
begin  
  i := Length(s);

  d := 0; m := 0; y := 0;
  
  for j := 3 downto 1 do begin
    ten := 1;
    while (i > 0) and (s[i] <> '.') do begin
      dig := DigCharToNum(s[i]);
      num := dig * ten;
      case j of 
        3: y := y + num;
        2: m := m + num;
        1: d := d + num;
      end;
      ten := ten * 10;
      Dec(i);
    end;
    if (i > 0) and (s[i] = '.') then Dec(i);
  end;
  
  // WriteLn('d=', d, ' m=', m, ' y=', y);
  
  for i := 1 to days do begin
    Inc(d);
    if (d > DAYS_PER_MONTH[m]) or ((m = 2) and (d = 29) and (not IsLeapYear(y))) then begin
      d := 1;
      Inc(m);
      if m = 13 then begin
        m := 1;
        Inc(y);
      end;
    end;
  end;
  
  result := IntToStr(d) + '.' + IntToStr(m) + '.' + IntToStr(y);
  
end;

// Функция для замены каждой даты на дату следующего дня:
function ReplaceDates(s: String): String;
var
  i, j: Integer;
  substr, subst: String;
  prev: Integer;
begin
  result := '';
  
  prev := 1;
  
  j := -1;
  for i := 1 to Length(s) do begin    
    
    // Разделители дат в предложении:
    if     (s[i] = ' ')
        or (s[i] = ',')
        or (s[i] = '!') 
        or (s[i] = '?')
        
        or (i = Length(s)) then begin        
        
          if j <> -1 then begin
            substr := Copy(s, j, i - j);
            // WriteLn('"', substr, '" = [', j, '; ', i - 1, ']');  // DEBUG
            
            if isDate(substr) then begin
              // WriteLn('Подстрока "', substr, '" является датой. +1 день = ', AddDaysToDate(substr, 1));
              subst := AddDaysToDate(substr, 1);  // дата следующего дня.
              result := Concat(result, Copy(s, prev, j - prev), subst);
              prev := i;
            end;
            
          end;
          j := -1;
          continue;
          
    end else
    
      if j = -1 then begin
        j := i;
      end;

  end;
  
  result := Concat(result, Copy(s, prev, Length(s) - prev + 1));

end;

{
function isOneOrTwoDigAndDot(s: String; idx: Integer; min1, max1: Integer; min2, max2: Integer): Integer;
var
  len, num: Integer;
begin
  result := -1;
  
  len := Length(s);
  
  if (idx <= len) and isDig(s[idx]) and (idx + 1 <= len) then begin
  
      if (s[idx + 1] = '.') then begin
        
        num := DigCharToNum(s[idx]);
        if (num >= min1) and (num <= max1) then
          result := idx + 2;
      
      
      end else if isDig(s[idx + 1]) and
                  (idx + 2 <= len) and (s[idx + 2] = '.') then begin
        num := (DigCharToNum(s[idx]) * 10) + DigCharToNum(s[idx + 1]);
        if (num >= min2) and (num <= max2) then
          result := idx + 3;
      end;
  
  end;
  
end;

// Функция для замены каждой даты сообщения на дату следующего дня:
function ReplaceDatesInStr(s: String): String;
var
  dayStartIdx: Integer;
  monthStartIdx: Integer;
  yearStartIdx: Integer;
begin
  dayStartIdx := 1;
  while dayStartIdx <= Length(s) do begin
  
    monthStartIdx := isOneOrTwoDigAndDot(s, dayStartIdx, 1, 9, 10, 31);
    // WriteLn('dayStartIdx=', dayStartIdx, ' monthStartIdx=', monthStartIdx);
    
    if (monthStartIdx <> -1) then begin
      yearStartIdx := isOneOrTwoDigAndDot(s, monthStartIdx, 1, 9, 10, 12);
      // WriteLn('yearStartIdx=', yearStartIdx);
      
      if (yearStartIdx <> -1) then begin
        WriteLn(Copy(s, dayStartIdx, yearStartIdx - dayStartIdx + 1));
      end;
      
    end;
    
    Inc(dayStartIdx);
  end;
end;
}

var
  s: String;
begin
  s := Input();
  WriteLn(ReplaceDates(s));
end.
