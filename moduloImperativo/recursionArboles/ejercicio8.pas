{8. Escribir un programa que:
a. Implemente un módulo que lea números enteros y los almacene en un árbol
binario de búsqueda. La lectura finaliza con el valor 0.
b. Una vez generado el árbol, realice módulos independientes para:
i. Obtener el número más grande.
ii. Obtener el número más chico.
iii. Obtener la cantidad de elementos.
iv. Informar los números en orden creciente.
v. Informar los números pares en orden decreciente.}

program ejercicio8;

type
	arbol = ^nodo;
	nodo = record
		dato : Integer;
		HI: arbol;
		HD: arbol;
	end;

procedure crearArbol(var a: arbol; num: integer);
begin
	if (a = nil) then 
	begin
		new(a);
		a^.dato:= num;
		a^.HI:= nil;
		a^.HD:= nil;
	end
	else
		if (num < a^.dato) then 
			crearArbol(a^.HI,num)
		else
			crearArbol(a^.HD, num);
end;


procedure cargarArbol(var a:arbol);
var
	num: Integer;
begin
	write('Ingrese un numero: ');
	readln(num);
	while (num <> 0) do 
	begin
		crearArbol(a,num);

		write('Ingrese un numero: ');
		readln(num);
	end;
end;

function numeroMaximo(a: arbol): Integer;
begin
	if (a = nil) then 
		numeroMaximo:= -1
	else
		if (a^.HD = nil) then 
			numeroMaximo:= a^.dato
		else
			numeroMaximo:= numeroMaximo(a^.HD);
end;

function numeroMinimo(a: arbol): Integer;
begin
	if (a = nil) then 
		numeroMinimo:= -1
	else
		if (a^.HI = nil) then 
			numeroMinimo:= a^.dato
		else
			numeroMinimo:= numeroMinimo(a^.HI);
end;

procedure cantElementos(a: arbol; var cantElem: Integer);
begin
	if (a <> nil) then 
	begin
		cantElem:= cantElem + 1;
		cantElementos(a^.HI, cantElem);
		cantElementos(a^.HD, cantElem);
	end;
end;

procedure ordenCreciente(a: arbol);
begin
	if (a <> nil) then 
	begin
		ordenCreciente(a^.HI);
		writeln(a^.dato);
		ordenCreciente(a^.HD);
	end;
end;

procedure ordenDecrecientesPares(a:arbol);
begin
	if (a <> nil) then 
	begin
		ordenDecrecientesPares(a^.HD);
		if ((a^.dato mod 2) = 0) then 	
			writeln(a^.dato);
		ordenDecrecientesPares(a^.HI);
	end;
end;

var
	a: arbol;
	
begin

	a:= nil;

	cargarArbol(a);

	writeln('El numero mas grande del arbol es: ', numeroMaximo(a));
	writeln('El numero mas chico del arbol es: ', numeroMinimo(a));

	writeln('### IMPRIMO ORDEN CRECIENTE ###');
	ordenCreciente(a);

	writeln('### IMMPRIMO NUMEROS PARES DECRECIENTES ###');
	ordenDecrecientesPares(a);

	readln();

end.