{2. Un cine posee la lista de películas que proyectará durante el mes de octubre. De cada
película se conoce: código de película, código de género (1: acción, 2: aventura, 3: drama,
4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror) y puntaje promedio otorgado
por las críticas.
Implementar un programa modularizado que:
a. Lea los datos de películas y los almacene por orden de llegada y agrupados por
código de género, en una estructura de datos adecuada. La lectura finaliza cuando se lee
el código de película -1.
b. Una vez almacenada la información, genere un vector que guarde, para cada
género, el código de película con mayor puntaje obtenido entre todas las críticas.
c. Ordene los elementos del vector generado en b) por puntaje.
d. Luego de ordenar el vector, muestre el código de película con mayor puntaje y el
código de película con menor puntaje.}

program ejercicio2;
type
	rangoGenero = 1..8;

	pelicula = record
		codPelicula: Integer;
		codGenero: rangoGenero;
		puntajePromedio: real;
	end;

	lista = ^nodo;
	nodo = record
		dato : pelicula;
		sig: lista;
	end;

	vPeliculas = array[rangoGenero] of lista;
	vPeliMejorPuntaje = array[rangoGenero] of pelicula;

procedure leerPelicula(var p: pelicula);
begin
	write('Ingrese el codigo de la pelicula: ');
	readln(p.codPelicula);
	if (p.codPelicula <> -1) then 
	begin
		write('Ingrese el codigo de genero: ');
		readln(p.codGenero);
		write('Ingrese el puntaje promedio de la pelicula: ');
		readln(p.puntajePromedio);
		writeln('-----------------------------------------------');
	end;
end;

procedure agregarAtras(var l:lista; p: pelicula);
var
	nue, aux: lista;
begin
	new(nue);
	nue^.dato:= p;
	nue^.sig:= nil;

	if (l = nil) then
		l:= nue
	else
	begin
		aux:= l;
		while (aux^.sig <> nil) do 
			aux:= aux^.sig;
		aux^.sig:= nue;
	end;
end;

procedure inicializarVectorLista(var vp: vPeliculas);
var
	i: Integer;
begin
	for i := 1 to 8 do 
		vp[i]:= nil;
end;

{a. Lea los datos de películas y los almacene por orden de llegada y agrupados por código de género, en una estructura de datos adecuada.
La lectura finaliza cuando se lee el código de la película -1.}
procedure cargarPeliculas(var vp: vPeliculas);
var
	p: pelicula;
begin
	leerPelicula(p);

	while (p.codPelicula <> -1) do 
	begin
		agregarAtras(vp[p.codGenero], p);
		leerPelicula(p);
	end;
end;

{b. Una vez almacenada la información, genere un vector que guarde, para cada
género, el código de película con mayor puntaje obtenido entre tod.}
procedure maximo(codPelicula: Integer; promedio: real; var maxCodigo: Integer; var maxProemdio: real );
begin
	if (promedio >= maxProemdio) then 
	begin
		maxProemdio:= promedio;
		maxCodigo:= codPelicula;
	end;
end;

procedure maximoPorGenro(l:lista; var max: pelicula);
begin
	max.codPelicula:= -1;
	max.puntajePromedio:= -1;
	while (l <> nil) do 
	begin
		maximo(l^.dato.codPelicula, l^.dato.puntajePromedio,max.codPelicula, max.puntajePromedio);
		l:= l^.sig;
	end;
end;


procedure generarVectorMejores( vp: vPeliculas; var vMejor:vPeliMejorPuntaje); //INCISO B
var
	i:integer;
	max: pelicula;
begin
	for i:=1 to 8 do begin
		maximoPorGenro(vp[i],max);
		vMejor[i]:= max;
	end;
end;


{c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de
los dos métodos vistos en la teoría.}

procedure ordenar(var v:vPeliMejorPuntaje);

var
	i,j,p:integer;
	peli:pelicula;
begin
	for i:=1 to 7 do begin
		p:=i;
		for j:=i+1 to 8 do
			if v[j].puntajePromedio < v[p].puntajePromedio then p:=j; // en p queda el indice del menor elemento
		//intercambia el menor elemento por el actual
		
		peli:= v[p]; //menor elemento
		v[p]:=v[i];
		v[i]:=peli;
	end;
end;

var
	vp: vPeliculas;
	vMejor: vPeliMejorPuntaje;
	i,j: Integer;
	p: pelicula;
	
begin

	inicializarVectorLista(vp);
	cargarPeliculas(vp);
	generarVectorMejores(vp, vMejor);

	for i := 1 to 8 do 
		writeln('i ', 'Mejor: ', vMejor[i].codPelicula);

	ordenar(vMejor);
	writeln('codigo de pelicula con mejor puntaje: ', vMejor[8].codPelicula);
	writeln('codigo de pelicula con peor puntaje: ', vMejor[1].codPelicula);

	j:= 1;
	while (vMejor[j].codPelicula = -1) do 
		j:= j + 1;
	writeln('Codigo de pelicula con pero puntaje! ', vMejor[j].codPelicula);

	readln();
end.