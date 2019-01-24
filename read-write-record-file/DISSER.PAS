Program baza;
Uses crt;

type 
	spisok=record
		nomer:integer;
		material:string;
		prochnost:integer;
		tverdoct:integer;
		znachenie:real;
	end;

	FT= File of spisok;

var 
	a:ft;
	i,z:integer;
	s:real;

procedure Sozd (var a:ft);
var 
	i,j: integer;
	zk:spisok;
begin
	rewrite (a);
	j:=1;
	while j<>80 do
	begin
		write ( 'vvedite material ');
		readln (zk.material);
		write ('Vvedite prochnost ');
		readln (zk.prochnost);
		write ( 'vvedite tverdoct ');
		readln (zk.tverdoct);
		zk.znachenie:=1/zk.prochnost+1/zk.tverdoct;
		write(a, zk);
		writeln ('Esli  konec zapisi to nazmite 80');
		readln (j);
	end;
	close (a);
end;

Procedure vyvod (var a:ft);
var 
	i:integer;
	zk:spisok;
begin
	reset (a);
	writeln ('=================================');
	writeln (' material prochnost  tverdoct ');
	writeln ('=================================');
	while not eof (a) do
	begin
		read (a,zk);
		write (' ', zk.material:6,' ');
		write (' ', zk.prochnost:9,' ');
		write (' ', zk.tverdoct:9,' ');
		writeln;
		writeln ('-----------------------------');
	end;
	close (a);
end;

procedure delete (var a:ft);
var 
	n,m:longint;
	i:byte;
	mas: array [1..20] of spisok;
begin
	i:=1;
	reset (a);
	writeln ('vvedite nomer zapisi dljz udalenila ');
	readln (n);
	m:= filesize(a)-n;
	seek (a,n);
	while not eof (a) do
	begin
		read (a, mas[i]);
		i:=i+1;
	end;
	seek (a, n-1);
	truncate (a);
	seek (a,n-1);
	for i:=1 to m do
		write (a,mas[i]);
end;

Procedure poisk (var a:ft);
var 
	i: integer;
	zk:spisok;
	max:real;
	num, nmax:integer;
begin
	max:=0;
	reset (a);
	num:=0;
	while not eof (a) do
	begin
		read (a,zk);
		IF max<zk.znachenie then
		begin
			max:=zk.znachenie;
			nmax:=num;
		end;
		num:=num+1;
	end;
	close (a);
	reset (a);
	seek (a, nmax);
	read (a,zk);
	write (' ', zk.material:6,' ');
	write (' ', zk.prochnost:9,' ');
	write (' ', zk.nomer:6,' ');
	write (' ', zk.tverdoct:9,' ');
	writeln;
	writeln ('---------------------------------');
	close (a);
end;

begin
	clrscr;
	assign (a,'fff');
	writeln (' MEHIO     ');
	writeln ('1:cozdanie ');
	writeln ('2:vyvod ');
	writeln ('3:delete ');
	writeln ('4:poisk ');
	writeln ('5:vyxod ');
	readln (z);
	case z of
		1: sozd (a);
		2:vyvod (a);
		3:delete (a);
		4:poisk (a);
		5:exit;
	end;
	readln
end.
