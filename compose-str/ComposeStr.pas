program ComposeStr;

var
  i, j: Integer;  // счётчики.
  A, B: String;  // две строки А и В.
  isFound: Boolean;  // найдена ли буква из B в A?
  isPossible: Boolean;  // можно ли из букв, входящих в А, составить В?

begin
  WriteLn('Эта программа, проверяет, можно ли из букв, входящих в А, составить В.');
  
  Write('Введите строку A -> ');
  ReadLn(A);
  
  Write('Введите строку B -> ');
  ReadLn(B);
  
  isPossible := TRUE;  // изначально считаем, что можно из букв, входящих в А, составить В.
  
  for i := 1 to Length(B) do begin
    
    isFound := FALSE;
    for j := 1 to Length(A) do begin
      if B[i] = A[j] then begin
        isFound := TRUE;
        
        // Т.к. буквы можно использовать не более одного раза, то удаляем букву из строки A:
        A := Concat(Copy(A, 1, j - 1), Copy(A, j + 1, Length(A) - j));
        
        break;
      end;
    end;
    
    if not isFound then begin
      isPossible := FALSE;
      break;
    end;
    
  end;
  
  if isPossible then begin
    WriteLn('Можно составить.');
  end else begin
    WriteLn('Нельзя составить.');
  end;
  
end.
