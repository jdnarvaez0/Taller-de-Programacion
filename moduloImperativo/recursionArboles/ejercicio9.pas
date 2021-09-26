{9. Implemente un programa que invoque a un módulo que genere un árbol binario de
búsqueda con nombres de personas que se leen desde teclado. La lectura finaliza con el
nombre ‘ZZZ’ que no debe procesarse. También debe invocar a otro módulo que reciba el
árbol generado y un nombre, y retorne verdadero si existe dicho nombre en el árbol o falso
en caso contrario.}


program ejercicio9;

type
	arbol = ^nodo;
	nodo = record
		dato : String;
		HI: arbol;
		HD: arbol;
	end;

procedure crearArbol(var a: arbol; nombre: String);
begin
	if (a = nil) then 
	begin
		new(a);
		a^.dato:= nombre;
		a^.HI:= nil;
		a^.HD:= nil;
	end
	else
		if ( nombre < a^.dato) then 
			crearArbol(a^.HI, nombre)
		else
			crearArbol(a^.HD, nombre);
end;


procedure cargarArbol(var a: arbol);
var
	nom: String;
begin
	write('Ingrese un nombre: ');
	readln(nom);
	while (nom <> 'zzz') do 
	begin
		crearArbol(a,nom);

		write('Ingrese un nombre: ');
		readln(nom);
	end;
end;

function busquedaNombre(a:arbol; nom: String): Boolean;
begin
	if (a = nil) then 
		busquedaNombre:= false
	else
		if (nom = a^.dato) then
			busquedaNombre:= true
		else 
			if (nom < a^.dato) then 
				busquedaNombre:= busquedaNombre(a^.HI, nom)
			else
				busquedaNombre:= busquedaNombre(a^.HD, nom);
end;


var
	a: arbol;
	nom: String;
begin
	a:= nil;

	cargarArbol(a);

	write('Ingrese un nombre para buscar en el arbool: ');
	readln(nom);

	if (busquedaNombre(a,nom)) then 
		writeln('El nomhre ', nom, ' esta en el arbol')
	else
		writeln('El nombre ', nom, ' no esta en el arbol o esta vacio');
	
	readln();
end.