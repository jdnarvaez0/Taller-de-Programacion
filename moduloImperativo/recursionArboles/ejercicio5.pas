{5. Escribir un programa que:
a. Implemente un módulo que genere un vector de 20 números enteros.
b. Implemente un módulo recursivo que devuelva el máximo valor del vector.
c. Implementar un módulo recursivo que devuelva la suma de los valores contenidos
en el vector.}


program ejercicio5;

const
	dimF = 20;

type
	vector = array[1..dimF] of  Integer;

procedure cargarVector(var v: vector);
var
	i: Integer;
begin
	for i := 1 to dimF do 
		v[i]:= random(30);
end;

procedure imprimirVector(v: vector);
var
	i: Integer;
begin
	for i := 1 to dimF do 
		writeln(v[i]);
end;

procedure  maximoRecursivo(v:vector; var max:integer; dimL:integer);
begin
	 if (dimL < dimF) then begin
		 dimL:=dimL+1;
		 if (v[dimL] > max) then
			 max:= v[dimL];
		 maximoRecursivo (v,max,dimL);
	 end;
end;

function sumarVector(v: vector; i: integer; dl: integer): integer;
    begin
        if i<=dl then 
            sumarVector:= v[i] + sumarVector(v, i +1, dl)
        else
            sumarVector:= 0;
    end;


var
	v: vector;
	dimL,max, totalSuma,i: Integer;
	
begin

	dimL:= 0;
	max:= -1;
	i:= 0;
	

	cargarVector(v);

	writeln('### IMPRIMO VECTOR ###');
	imprimirVector(v);

	maximoRecursivo(v,max,dimL);
	writeln('El numero mayor del vector es: ', max);


	
	writeln('La suma total de los elementos del vector son: ', sumarVector(v,i,dimL));
	readln();

end.