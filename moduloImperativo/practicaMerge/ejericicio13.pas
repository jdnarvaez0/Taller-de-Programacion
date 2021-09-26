{13. Un teatro tiene funciones los 7 días de la semana. Para cada día se tiene una lista con las
entradas vendidas. Se desea procesar la información de una semana
Implementar un programa que:
a. Genere 7 listas con las entradas vendidas para cada día. De cada entrada se lee día (de 1
a 7), código de la obra, asiento y monto. La lectura finaliza con el código de obra igual a 0.
Las listas deben estar ordenadas por código de obra de forma ascendente.
b. Genere una nueva lista que totalice la cantidad de entradas vendidas por obra. Esta lista
debe estar ordenada por código de obra de forma ascendente.}

program ejercicio13;

const
	dimF = 7;

type
	rangoDia = 1..7;

	entrada = record
		dia : rangoDia;
		codObra : Integer;
		asiento : Integer;
		monto : real;
	end;

	
	lista = ^nodo;
	nodo = record
		dato : entrada;
		sig : lista;
	end;

	total = record
		codObra : Integer;
		Etotal: Integer;
	end;

	lista2 = ^nodo2;
	nodo2 = record
		dato : total;
		sig: lista2;
	end;

	vector = array[1..dimF] of lista;

procedure inicializarVector(var v: vector);
var
	i: Integer;
begin
	for i := 1 to dimF do 
		v[i]:= nil;
end;

procedure leerEntrada(var e: entrada);
begin
	write('Ingrese el codigo de la obra: ');
	readln(e.codObra);
	if (e.codObra <> 0) then 
	begin
		write('Ingrese dia de la semana: ');
		readln(e.dia);
		write('Ingrese el numero del asiento: ');
		readln(e.asiento);
		write('Ingrese monto: ');
		readln(e.monto);
		writeln('-------------------------------');
	end;
	writeln();
end;

procedure agregarOrdenado(var l:lista; e: entrada);
var
	nue, ant, act: lista;
begin
	new(nue);
	nue^.dato:= e;
	act:= l;
	ant:= l;

	while (act <> nil) and (l^.dato.codObra < e.codObra) do 
	begin
		ant:= act;
		act:= act^.sig;
	end;
	if (act = ant) then 
		l:= nue
	else
		ant^.sig:= nue;
	nue^.sig:= act;
end;


procedure cargarVector(var v: vector);
var
	e: entrada;
begin
	leerEntrada(e);
	while (e.codObra <> 0) do 
	begin
		agregarOrdenado(v[e.dia], e);
		leerEntrada(e);
	end;
end;

procedure agregarAtras(var l,ult: lista2; canTotal,codO:Integer);
var
	nue: lista2;
begin
	new(nue);
	nue^.dato.codObra:= codO;
	nue^.dato.Etotal:= canTotal;
	nue^.sig:= nil;		
	if (l = nil) then 
		l:= nue
	else
		ult^.sig:= nue;
	ult:= nue;
end;

procedure minimo(var v: vector; var min: Integer);
var
	i,indiceMin: Integer;
begin
	min:= 9999;
	indiceMin:= -1;

	for i := 1 to dimF do 
		if (v[i] <> nil) and (v[i]^.dato.codObra <= min) then 
		begin
			min:= v[i]^.dato.codObra;
			indiceMin:= i;
		end;
	if (indiceMin <> -1) then 
		v[indiceMin]:= v[indiceMin]^.sig;
end;

procedure merge(v: vector; var lN: lista2);
var
	min,canTotal,act: Integer;
	ult: lista2;
begin
	lN:= nil;
	minimo(v,min);
	while (min <> 9999) do 
	begin
		act:= min;
		canTotal:= 0;
		while (min <> 9999) and (min = act) do 
		begin
			canTotal:= canTotal + 1;
			minimo(v, min);
		end;
		agregarAtras(lN,ult,canTotal,act);
	end;
end;

procedure imprimir(lN:lista2);
begin
	writeln('|--------------Lista MERGE--------------------|');
	while (lN<>nil)do
	begin
		writeln('');
		writeln('   codigo de la obra: ',lN^.dato.codObra);
		writeln('   cantidad total de entradas vendidas: ',lN^.dato.Etotal);
		lN:=lN^.sig
	end;
end;

var
	v: vector;
	lN: lista2;
	
begin

	inicializarVector(v);
	cargarVector(v);
	merge(v,lN);
	imprimir(lN);

	readln();
	
end.