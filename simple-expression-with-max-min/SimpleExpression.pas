program SimpleExpression;
var
  A, B, C, D, Z: Integer;
begin
  write('A = ');
  readln(A);
  
  write('B = ');
  readln(B);
  
  write('C = ');
  readln(C);
  
  write('D = ');
  readln(D);
  
  if B < C then
    if B < D then
    
      // B минимальный из B, C, D; т.к. B < C и B < D
      if A > B then
        Z := A
      else
        Z := B
        
    else
    
      // D минимальный из B, C, D; т.к. B < C, а D <= B
      if A > D then
        Z := A
      else
        Z := D
        
  else
    if C < D then
    
      // C минимальный из B, C, D; т.к. C <= B и C < D
      if A > C then
        Z := A
      else
        Z := C
        
    else
    
      // D минимальный из B, C, D; т.к. C <= B и D <= C
      if A > D then
        Z := A
      else
        Z := D;
        
  writeln('Z = max(', A, ', min(', B, ', ', C, ', ', D, ')) = ', Z);
end.
