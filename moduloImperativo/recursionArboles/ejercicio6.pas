{6. Implementar un módulo que realice una búsqueda dicotómica en un vector, utilizando el
siguiente encabezado:
Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);
Nota: El parámetro “pos” debe retornar la posición del dato o -1 si el dato no se encuentra
en el vector.}

program ejercicio6;

const
	dimF = 20;

type
	indice= 1..dimF;

	vector = array[1..dimF] of  Integer;

procedure cargarVector(var v: vector; var dimL: indice);
begin
	while (dimL < dimF) do
	begin
		v[dimL]:= random(20);
		dimL:= dimL + 1;
	end;
end;

procedure imprimirVector(v: vector; dimL: indice);
var
	i: Integer;
begin
	for i := 1 to dimL do 
		writeln(v[i]);
end;

procedure busquedaDicotomica(v: vector; ini, fin: indice; dato:integer; Var pos: indice);
begin
  if (ini>fin) then
    pos := -1
  else
   begin 
      pos := (ini+fin) div 2;
      if (v[pos]<>dato) then
       begin 
          if (dato<v[pos]) then
            busquedaDicotomica(v, ini, pos-1, dato, pos)
          else
            busquedaDicotomica(v, pos+1, fin, dato, pos);
        end;
    end;
end;

var
	v: vector;
	dato: Integer;
	pos,dimL: indice;

begin
	dimL:= 1;

	cargarVector(v, dimL);

	writeln('### IMPRIMO VECTOR ###');
	imprimirVector(v,dimL);

	write('Ingrese un dato para buscar en el array: ');
	readln(dato);

	busquedaDicotomica(v,1,dimL,dato,pos);
	writeln('El dato se encuetran en la posicion : ', pos);

	readln();
end.