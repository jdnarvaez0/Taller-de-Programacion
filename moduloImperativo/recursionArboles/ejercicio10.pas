{10. Implementar un programa que contenga:
a. Un módulo que lea información de alumnos de Taller de Programación y almacene
en una estructura de datos sólo a aquellos alumnos que posean año de ingreso posterior
al 2010. Esta estructura debe estar ordenada por legajo y debe ser eficiente para la
búsqueda por dicho criterio. De cada alumno se lee legajo, apellido, nombre, DNI y año de
ingreso.
b. Un módulo que reciba la nueva estructura e informe el nombre y apellido de
aquellos alumnos cuyo legajo sea inferior a 15853.
c. Un módulo que reciba la nueva estructura e informe el nombre y apellido de
aquellos alumnos cuyo legajo esté comprendido entre 1258 y 7692.}

program ejercicio10;

type

	str = String[20];

	alumno = record
		legajo : Integer;
		apellido: str;
		nombre: str;
		dni: Integer;
		anioIngreso: Integer;
	end;

	arbol = ^nodo;
	nodo = record
		dato : alumno;
		HI : arbol;
		HD : arbol;
	end;

procedure crearArbol(var a: arbol; alum: alumno);
begin
	if (a = nil) then 
	begin
		new(a);
		a^.dato:= alum;
		a^.HI:= nil;
		a^.HD:= nil;
	end
	else
		if ( alum.legajo < a^.dato.legajo) then 
			crearArbol(a^.HI, alum)
		else
			crearArbol(a^.HD, alum);
end;

procedure leerAlumno(var alum: alumno);
begin
	write('Anio de ingreso del alumno: ');
	readln(alum.anioIngreso);
	if (alum.anioIngreso > 2010) then 
	begin
		write('Legajo del alumno: ');
      	readln(alum.legajo);
      	write('Apellido del alumno: ');
      	readln(alum.apellido);
      	write('Nombre del alumno: ');
      	readln(alum.nombre);
      	write('DNI del alumno: ');
      	readln(alum.dni);
	end;
end;

procedure cargarArbol(var a: arbol);
var
	alum: alumno;
begin
	leerAlumno(alum);
	while (alum.anioIngreso > 2010) do 
	begin
		crearArbol(a,alum);
		leerAlumno(alum);
	end;
end;


procedure infoLegajoInferior15853(a: arbol);
begin
	if (a <> nil) then 
	begin
		if (a^.dato.legajo >= 15853) then 
			infoLegajoInferior15853(a^.HI)
		else
			begin
				write('Nombre: ', a^.dato.nombre);
				write('Apellido: ', a^.dato.apellido);
				infoLegajoInferior15853(a^.HI);
				infoLegajoInferior15853(a^.HD);
			end;
	end;
end;


procedure legajosEntre1258y7692(a:arbol);
begin
	if (a <> nil) then 
		if (a^.dato.legajo >= 7692) then 
			legajosEntre1258y7692(a^.HI)
		else
			if (a^.dato.legajo <= 1258) then 
				legajosEntre1258y7692(a^.HD)
			else
				write('Nombre: ', a^.dato.nombre);
				write('Apelldo: ', a^.dato.apellido);
				legajosEntre1258y7692(a^.HI);
				legajosEntre1258y7692(a^.HD);
end;

var
	a: arbol;
	
begin
	a:= nil;

	cargarArbol(a);
	infoLegajoInferior15853(a);
	legajosEntre1258y7692(a);
	readln();
	
end.