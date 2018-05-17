program FunctionAndQuadraticEquation;

type
  Roots = array [1..2] of Real;

function SolveQuadraticEquation(a, b, c: Real; var x: Roots): Boolean;
var
  d: Real;
begin
  d := Sqr(b) - 4 * a * c;
  if (d < 0) then begin
    result := FALSE;
    exit;
  end else begin
    x[1] := (-b + Sqrt(d)) / (2 * a);
    x[2] := (-b - Sqrt(d)) / (2 * a);
    result := TRUE;
  end;
end;

function v(x, d: Real): Real;
begin
  v := Sin(d * Power(Sqr(x) + 4, 1.0 / 5.0)) * Exp(2 * x);
end;

var
  a, b, c: Real;  // коэффициенты квадратного уравнения.
  root: Roots;  // корни квадратного уравнения.
  x: Real;  // меньший корень уравнения ax^2 + bx + c = 0.
  d: Real;  // аргумент для функции ν.
begin
  WriteLn('Введите коэффициенты квадратного уравнения a, b, c и аргумент d для функции ν:');
  ReadLn(a, b, c, d);
  
  if SolveQuadraticEquation(a, b, c, root) then begin
    WriteLn('Корни уравнения ax^2 + bx + c = ' 
                           + a + 'x^2 + ' + b + 'x + ' + c +' = 0: '
                           + root[1] + ' и ' + root[2]);
    x := Min(root[1], root[2]);
    WriteLn('Меньший корень уравнения: ' + x);
    WriteLn('ν = sin( d * (x^2 + 4)^(1/5) ) * e^(2*x) = ' 
              + 'sin( ' + d + ' * (' + x + '^2 + 4)^(1/5) ) * e^(2*' + x + ') = ' 
              + v(x, d));
  end else begin
    WriteLn('Ошибка! Корней нет.');
  end;
end.
