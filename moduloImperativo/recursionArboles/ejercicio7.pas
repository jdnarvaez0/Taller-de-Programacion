{7. Realizar un programa que lea números y que utilice un procedimiento recursivo que
escriba el equivalente en binario de un número decimal. El programa termina cuando el
usuario ingresa el número 0 (cero).
Ayuda: Analizando las posibilidades encontramos que: Binario (N) es N si el valor es
menor a 2. ¿Cómo obtenemos los dígitos que componen al número? ¿Cómo achicamos
el número para la próxima llamada recursiva? Ejemplo: si se ingresa 23, el programa
debe mostrar: 10111.}

program ejercicio7;

procedure numBinario(x: integer);
begin
  if (x<>0) then
    begin
      numBinario(x div 2);
      write(x mod 2);
    end;
end;

procedure leerNumeros(var num: integer);
begin

	write('Ingrese un numero: ');
	readln(num);
	while (num <> 0) do 
	begin
		
	numBinario(num);

	write('Ingrese un numero: ');
	readln(num);

	end;
end;
	
var
	num: Integer;

begin

	leerNumeros(num);
	readln();	
end.