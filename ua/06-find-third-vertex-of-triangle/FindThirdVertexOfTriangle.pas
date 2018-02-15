program FindThirdVertexOfTriangle;

// Прямоугольный треугольник:
//   A
//   |\
//   |α\
//   |  \ 
// b |   \ с - гипотенуза
//   |    \
//   |     \
//   |      \
//   |γ=90° β\
//   |________\
//   C   a   B
// Принято обозначать вершину прямого угла буквой C, а гипотенузу — c.
// Катеты обозначаются a и b, а величины противолежащих им углов — α и β соответственно.

type Point = record
  x: Real;
  y: Real;
end;

// Структура данных описывающая треугольник:
type Triangle = record
  pointA: Point;  // координаты вершины A.
  pointB: Point;  // координаты вершины B.
  pointC: Point;  // координаты вершины C.
  
  angleAlpha: Real;  // угол ∠BAC, вершина A, точки B и C лежат на разных сторонах угла.
  angleBeta: Real;   // угол ∠CBA, вершина B, точки C и A лежат на разных сторонах угла.
  angleGamma: Real;  // угол ∠ACB, вершина C, точки A и B лежат на разных сторонах угла.

  sideA: Real;  // катет a.
  sideB: Real;  // катет b.
  sideC: Real;  // гипотенуза c.
  
  area: Real;  // площадь.
end;

// Стороны:

function FindSideB(T: Triangle): Real;
begin
  Result := Sqrt( Power(T.pointC.x - T.pointA.x, 2)
                + Power(T.pointC.y - T.pointA.y, 2) );
end;

function FindSideA(T: Triangle): Real;
begin
  Result := Sqrt( Power(T.sideC, 2) - Power(T.sideB, 2) );
end;

// Углы:

function FindAngleAlpha(T: Triangle): Real;
begin
  Result := ArcSin(T.sideA / T.sideC);
  // см. https://ru.wikipedia.org/wiki/Решение_треугольников#Два_катета
end;

function FindAngleBeta(T: Triangle): Real;
begin
  Result := ArcSin(T.sideB / T.sideC);
  // см. https://ru.wikipedia.org/wiki/Решение_треугольников#Два_катета
end;

// Периметр:
function Perimeter(T: Triangle): Real;
begin
  Result := T.sideA + T.sideB + T.sideC;  
  // см. https://ru.wikipedia.org/wiki/Периметр#Формулы
end;

// Площадь:
function Area(T: Triangle): Real;
var
  p: Real;
begin
  p := Perimeter(T) / 2;  // полупериметр.
  
  // Формула Герона:
  Result := Sqrt(p * (p - T.sideA)
                   * (p - T.sideB) 
                   * (p - T.sideC));
  
  // см. https://ru.wikipedia.org/wiki/Треугольник#Площадь_треугольника
end;

// Точки:

function FindPointB(T: Triangle; no: Integer): Point;
var
  unitVec: Point;
begin
  
  // Единичный вектор:
  unitVec.x := (T.pointA.x - T.pointC.x) / T.sideB;
  unitVec.y := (T.pointA.y - T.pointC.y) / T.sideB;
  
  if no = 1 then begin  // первое решение.
    Result.x := T.pointC.x + (-unitVec.y * T.sideA);
    Result.y := T.pointC.y + (unitVec.x * T.sideA);
  end else begin  // второе решение.
    Result.x := T.pointC.x + (unitVec.y * T.sideA);
    Result.y := T.pointC.y + (-unitVec.x * T.sideA);
  end;

end;

function Input(): Triangle;

const
  NaN = 0.0 / 0.0;

  // Тестовые треугольник для отладки:
  TriangleExample1: Triangle = (  // египетский треугольник.
    pointA: (x: 4; y: 4); pointB: (x: NaN; y: NaN); pointC: (x: 4; y: 1);    
    angleAlpha: NaN; angleBeta: NaN; angleGamma: Pi / 2;  
    sideA: NaN; sideB: NaN; sideC: 5;
    area: NaN;
  );
  TriangleExample2: Triangle = (
    pointA: (x: 3; y: 5); pointB: (x: NaN; y: NaN); pointC: (x: 3; y: 2);    
    angleAlpha: NaN; angleBeta: NaN; angleGamma: Pi / 2;  
    sideA: NaN; sideB: NaN; sideC: 4;    
    area: NaN;
  );
  // см. http://wiki.freepascal.org/Record#Constant_record

var
  newTriangle: Triangle;

begin
  // DEBUG:
  //Result := TriangleExample1;
  //exit;
  
  newTriangle.angleGamma := Pi / 2;  // по условию задачи известен один из углов — он равен 90°.
  
  // В этом случае для решения прямоугольных треугольников необходимо знать ещё два элемента:
  // (см. https://ru.wikipedia.org/wiki/Решение_треугольников#Решение_прямоугольных_треугольников)

  // 1) катет:
  
  Write('Введите координаты вершины прямого угла: ');
  ReadLn(newTriangle.pointC.x, newTriangle.pointC.y);  // принято обозначать вершину прямого угла буквой C.
  
  Write('Введите координаты вершины: ');
  ReadLn(newTriangle.pointA.x, newTriangle.pointA.y);
  
  // 2) гипотенуза:
  
  Write('Введите длину гипотенузы: ');
  ReadLn(newTriangle.sideC);
  
  Result := newTriangle;
end;

procedure Solution(var T: Triangle; no: Integer);
begin
  T.sideB := FindSideB(T);
  T.sideA := FindSideA(T);
  
  T.angleBeta := FindAngleBeta(T);
  T.angleAlpha := FindAngleAlpha(T);
  
  T.pointB := FindPointB(T, no);
  
  T.area := Area(T);
end;

function RadiansToDegrees(radians: Real): Real;
begin
  Result := radians * 180 / Pi;
  // см. http://www.cleverstudents.ru/trigonometry/radian_and_degree_conversion.html
end;

procedure Output(T: Triangle);
var
  i := 1;
begin
  for i := 1 to 2 do begin
    Solution(T, i);
    writeln('Координаты вершин (решение №', i, '): ');
    write(' A: (', T.pointA.x, ',', T.pointA.y, '); ');
    write(' B: (', T.pointB.x, ',', T.pointB.y, '); ');
    writeln(' C: (', T.pointC.x, ',', T.pointC.y, ')');
  end;
  
  writeln('Стороны: ');
  writeln(' a = ', T.sideA, '; b = ', T.sideB, '; c = ', T.sideC);
  
  writeln('Углы: ');
  writeln(' α = ', RadiansToDegrees(T.angleAlpha),
        '°; β = ', RadiansToDegrees(T.angleBeta), 
        '°; γ = ', RadiansToDegrees(T.angleGamma), '°');
  writeln(' α + β + γ = ',
    RadiansToDegrees(T.angleAlpha + T.angleBeta + T.angleGamma), '°');
    
  writeln('Площадь: ');
  writeln(' S = ', T.area);
end;

var
  myTriangle: Triangle;
  choice: Char;
begin
  writeln('Назначением данной программы состоит в поиске третьей вершины прямоугольного треугольника.');
  while TRUE do begin
    myTriangle := Input();
    Output(myTriangle);
  
    // Программа завершается запросом на повтор расчетов:
    write('Для повтора введие Да или да. Повторить? ');
    readln(choice);
    if (choice <> 'Д') and (choice <> 'д') then
      break;
      
  end;
end.