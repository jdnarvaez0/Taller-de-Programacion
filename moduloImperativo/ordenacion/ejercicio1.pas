{1. El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de
las expensas de dichas oficinas.
Implementar un programa modularizado que:
a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De
cada oficina se ingresa el código de identificación, DNI del propietario y valor de la
expensa. La lectura finaliza cuando se ingresa el código de identificación -1, el cual no se
procesa.
b. Ordene el vector, aplicando el método de inserción, por código de identificación
de la oficina.
c. Ordene el vector aplicando el método de selección, por código de identificación
de la oficina.}

program ejercicio1;

const
	dimF = 300;

type
	indice = 1..dimF;

	oficina = record
		codigo : Integer;
		dni : Integer;
		valorExpensa : real;
	end;

	vector = array[1..dimF] of  oficina;


procedure leerDatos(var o: oficina);
begin
	write('Ingrese el codigo de identificacion: ');
	readln(o.codigo);
	if (o.codigo <> -1) then 
	begin
		write('Ingrese el DNI del propieratio: ');
		readln(o.dni);
		write('Ingrese el valor de expensas: ');
		readln(o.valorExpensa);
		writeln('----------------------------------');
	end;
end;

procedure cargarVector(var v: vector; var dimL: indice);
var
	o: oficina;
begin
	dimL:= 1;
	leerDatos(o);


	while ((o.codigo <> -1) and (dimL <= 300)) do
	begin
		v[dimL]:= o;
	 	
	 	dimL:= dimL + 1;
	 	leerDatos(o);	
	 end;
end;

{ORDENACION INSERCION}

procedure ordenacionInsercion(var v:vector; dimL: indice);
var
	i,j: Integer;
	actual: oficina;
begin
	for i := 2 to dimL do 
	begin
		actual:= v[i];
		j:= i-1;
		while (j > 0) and (v[j].codigo > actual.codigo) do 
		begin
			v[j+1]:= v[j];
			j:= j -1;
		end;
		v[j+1]:= actual;
	end;
end;

{ORDENACION SELECCION}

procedure ordenacionSeleccion(var v: vector; dimL: indice);
var
	i,j,p: indice;
	item: oficina;
begin
	for i := 1 to dimL-1 do 	
	begin
		p:=i;
		for j := i+1 to dimL do 
			if v[j].codigo < v[p].codigo then 
				p:= j;

		item:= v[p];
		v[p]:= v[i];
		v[i]:= item;
	end;
end;

procedure imprimirVector(v:vector; dimL: indice);
var
	i: Integer;
begin
	for i := 1 to dimL do 
	begin
		writeln('Oficina # ', i, 'codigo de identificacion: ', v[i].codigo, 'DNI propieratio: ', v[i].dni, 'valor expensas: ', v[i].valorExpensa);
	end;
end;



var
	o: oficina;
	v: vector;
	dimL: indice;
	
begin

	cargarVector(v,dimL);
	imprimirVector(v,dimL);
	writeln('----------------------------');
	ordenacionInsercion(v,dimL);
	writeln('### IPRIMO VECTOR POR INSERCION ###');
	imprimirVector(v,dimL);
	ordenacionSeleccion(v,dimL);
	writeln('### IPRIMO VECTOR POR SELECCION ###');
	imprimirVector(v,dimL);

	readln();
	
end.