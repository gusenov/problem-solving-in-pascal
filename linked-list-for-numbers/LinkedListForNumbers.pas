program LinkedListForNumbers;

type
  DataType = Integer;  // тип данных хранящегося в элементе списка значения.
  ElementPtr = ^Element;  // указатель на элемент списка.
  Element = record  // элемент списка:
    value: DataType;
    nextElement: ElementPtr;
  end;

// Процедура, которая вставляет новый элемент E после первого элемента непустого списка:
procedure InsertAfterFirst(var firstElement: ElementPtr; E: DataType);
var
  newEl: ElementPtr;
begin
  New(newEl);
  newEl^.value := E;
  newEl^.nextElement := firstElement^.nextElement;
  firstElement^.nextElement := newEl;
end;

// Процедура, которая вставляет новый элемент E1 за каждым вхождением элемента E:
procedure InsertAfter(var firstElement: ElementPtr; E: DataType; E1: DataType);
var
  el: ElementPtr;
  newEl: ElementPtr;
begin
  el := firstElement;
  while el <> NIL do begin
    if el^.value = E then begin
      New(newEl);
      newEl^.value := E1;
      newEl^.nextElement := el^.nextElement;
      el^.nextElement := newEl;
    end;
    el := el^.nextElement;
  end;
end;

// Вывод элементов списка на экран:
procedure PrintLinkedList(firstElement: ElementPtr);
var
  el: ElementPtr;
begin
  el := firstElement;
  while el <> NIL do begin
    Write('[', el^.value, '] ');
    el := el^.nextElement;
  end;
  WriteLn;
end;

function Input(title: String): DataType;
begin
  Write('Введите значение ', title, ' -> ');
  ReadLn(Result);
end;

var
  firstElement: ElementPtr;  // указатель на начало списка.
  choice: Char;

begin

  // Создание первого элемента списка:
  New(firstElement);
  Write('Введите первый элемент списка -> ');
  ReadLn(firstElement^.value);
  firstElement^.nextElement := NIL;

  WriteLn('Меню:');
  WriteLn(' 1) Вставить новый элемент E после первого элемента непустого списка.');
  WriteLn(' 2) Вставить новый элемент E1 за каждым вхождением элемента E.');
  WriteLn(' 3) Вывести список на экран.');
  WriteLn(' 4) Выход.');  
  while TRUE do begin
    Write('Введите номер пункта меню -> ');
    ReadLn(choice);
    case choice of
      '1': InsertAfterFirst(firstElement, Input('E'));
      '2': InsertAfter(firstElement, Input('E'), Input('E1'));
      '3': PrintLinkedList(firstElement);
      '4': break;
    end;
  end;
  
end.
