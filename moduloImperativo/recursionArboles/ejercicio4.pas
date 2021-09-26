{4. Escribir un programa que:
a. Implemente un módulo que genere una lista a partir de la lectura de números
enteros. La lectura finaliza con el número -1.
b. Implemente un módulo recursivo que devuelva el mínimo valor de la lista.
c. Implemente un módulo recursivo que devuelva el máximo valor de la lista.
d. Implemente un módulo recursivo que devuelva verdadero si un valor determinado
se encuentra en la lista o falso en caso contrario.}

program ejercicio4;

type
	lista = ^nodo;
	nodo = record
		dato : Integer;
		sig : lista;
	end;

procedure agregarAdelante(var l:lista; num: Integer);
var
	nue: lista;
begin
	new(nue);
	nue^.dato:= num;
	nue^.sig:= l;
	l:= nue;
end;

procedure cargarLista(var l:lista);
var
	n: Integer;
begin

	write('Ingrese un numero: ');
	readln(n);

	while (n <> -1) do 
	begin
		
		agregarAdelante(l,n);

		write('Ingrese un numero: ');
		readln(n);
	end;
end;


procedure minimo(l:lista; var min: Integer);
begin
	if (l <> nil) then 
	begin
		if (min > l^.dato) then 
			min:= l^.dato;
		minimo(l^.sig, min);
	end;
end;

procedure maximo(l:lista; var max: Integer);
begin
	if (l <> nil) then 
	begin
		if (max < l^.dato) then 
			max:= l^.dato;
		maximo(l^.sig, max);
	end;
end;

function buscar (l:lista; x:integer):boolean;
begin
	 if (l <> nil) then begin
		 if(l^.dato <> x )then
			buscar:= buscar(l^.sig,x)
		 else
			buscar:= true;
	 end;
	 if (l = nil) then
		buscar:= false;
end;


var
	l: lista;
	max,min,x: Integer;

begin
	max:= -1;
	min:= 9999;

	l:= nil;

	cargarLista(l);
	minimo(l,min);
	writeln('El numero mas chico de la lista es: ', min);
	maximo(l,max);
	writeln('El numero mas grande de la lista es: ', max);

	write('Ingrese un numero para buscar en la lista: ');
	readln(x);

	if (buscar(l,x)) then
		writeln('El numero esta en la lista') 
	else
		writeln('El numero no esta en la lista');

	readln();
	
end.