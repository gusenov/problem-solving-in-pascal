program Spiral;

uses GraphABC;

var
  n: Integer;  // количество витков спирали.
  
  r: Integer;  // начальный радиус спирали.
  rstep: Integer;  // шаг увеличения радиуса в пикселах.
  
  t: Integer;  // начальный угол поворота спирали.
  tstep: Integer;  // шаг увеличения угла в градусах.
  
  x, y: Integer;
  xold, yold: Integer;
  xc, yc: Integer;  // координаты центра окна.

begin

  WriteLn('Введите количество витков спирали...');
  ReadLn(n);

  WriteLn('Введите начальный радиус спирали и шаг увеличения (в пикселах)...');
  ReadLn(r, rstep);
  
  WriteLn('Введите начальный угол поворота спирали и шаг увеличения (в градусах)...');
  ReadLn(t, tstep);

  // Начало координат.
  xc := Window.Width div 2;
  yc := Window.Height div 2;

  xold := xc;
  yold := yc;

  repeat
    x := xc + round(r * cos(t * pi / 180));
    y := yc - round(r * sin(t * pi / 180));
    
    MoveTo(xold, yold);
    LineTo(x, y);
    
    xold := x;
    yold := y;
    
    t := t + tstep;  // увеличиваем угол на tstep градусов.
    r := r + rstep;  // увеличиваем радиус на rstep пикселов.
  until t > n * 360;  // делаем n оборотов.

end.
