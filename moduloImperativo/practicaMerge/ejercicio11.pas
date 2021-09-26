{11. Un cine posee la lista de películas que proyectará durante el mes de octubre. De cada
película se conoce: código de película, código de género (1: acción, 2: aventura, 3: drama,
4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror) y puntaje promedio otorgado
por las críticas.
Implementar un programa que contenga:
a. Un módulo que lea los datos de películas y los almacene ordenados por código de
película y agrupados por código de género, en una estructura de datos adecuada. La
lectura finaliza cuando se lee el código de película -1.
b. Un módulo que reciba la estructura generada en el punto a y retorne una
estructura de datos donde estén todas las películas almacenadas ordenadas por código de
película.}

program ejercicio11;

const
	dimF = 8;

type

	rangoCodGnero = 1..dimF;

	pelicual = record
		codPelicual : Integer;
		codGenero : rangoCodGnero;
		puntajePromedio : real; 
	end;

	lista = ^nodo;
	nodo = record
		dato : pelicual;
		sig : lista;
	end;

	vector = array[1..dimF] of lista;

procedure inicializarVector(var v: vector);
var
	i: Integer;
begin
	for i := 1 to dimF do 
		v[i]:= nil;
end;

procedure leerPeliculas(var p: pelicual);
begin
	write('Ingrese el codigo de pelicula: ');
	readln(p.codPelicual);
	if (p.codPelicual <> -1) then 
	begin
		write('Ingres el codigo de genero: ');
		readln(p.codGenero);
		write('Ingrese puntaje promedio de la pelicual: ');
		readln(p.puntajePromedio);
	end;
	writeln('--------------------------------------');
	writeln();
end;

procedure agregarOrdenado(var l:lista; p: pelicual);
var
	nue, ant, act: lista;
begin
	new(nue);
	nue^.dato:= p;
	act:= l;
	ant:= l;

	while (act <> nil) and (p.codPelicual > act^.dato.codPelicual) do 
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
	p: pelicual;
begin
	leerPeliculas(p);
	while (p.codPelicual <> -1) do 
	begin
		agregarOrdenado(v[p.codGenero], p);
		leerPeliculas(p);
	end;
end;

procedure minimo(var min: pelicual; var pos: rangoCodGnero; var v: vector);
var
	i: rangoCodGnero;
begin
	min.codPelicual:= 9999;

	for i := 1 to dimF do 	
	begin
		if (v[i] <> nil) then 
			if (v[i]^.dato.codPelicual < min.codPelicual) then 
			begin
				min:= v[i]^.dato;
				pos:= 1;
			end;
	end;
	if (min.codPelicual <> 9999) then 
		v[pos]:= v[pos]^.sig;
end;

procedure agregarAtras(var l,ult: lista; min: pelicual);
var
	nue: lista;
begin
	new(nue);
	nue^.dato:= min;
	nue^.sig:= nil;
	if (l = nil) then
		l:= nue
	else
		ult^.sig:= nue;
	ult:= nue;
end;

procedure merge(var l: lista; v: vector);
var
	min: pelicual;
	pos: rangoCodGnero;
	ult: lista;
begin
	ult:= nil;

	minimo(min,pos,v);
	while (min.codPelicual <> 9999) do 
	begin
		agregarAtras(l,ult,min);
		minimo(min,pos,v);
	end;
end;



var
	v: vector;
	l: lista;
	
begin

	l:= nil;

	inicializarVector(v);
	cargarVector(v);
	merge(l,v);
	readln();
	
end.