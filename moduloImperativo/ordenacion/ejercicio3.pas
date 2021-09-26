{3. Una librería requiere el procesamiento de la información de sus productos. De cada
producto se conoce el código del producto, código de rubro (del 1 al 8) y precio.
Implementar un programa modularizado que:
a. Lea los datos de los productos y los almacene ordenados por código de producto y
agrupados por rubro, en una estructura de datos adecuada. El ingreso de los productos
finaliza cuando se lee el precio 0.
Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro.
b. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3.
Considerar que puede haber más o menos de 30 productos del rubro 3. Si la cantidad de
productos del rubro 3 es mayor a 30, almacenar los primeros 30 que están en la lista e
ignore el resto.}

program ejercicio3;

const
	dimF = 30;

type
	rangoRubro = 1..8;

	producto = record
		codProducto : Integer;
		codRubro : rangoRubro;
		precio : Integer;
	end;

	lista = ^nodo;
	nodo = record
		dato : producto;
		sig : lista;
	end;

	vProductos = array[rangoRubro] of lista;
	vRubroTres = array[1..dimF] of producto;

procedure leerProducto(var p: producto);
begin
	write('Ingrese el precio del producto: ');
	readln(p.precio);
	if (p.precio <> 0) then 
	begin
		write('Ingrese el codigo del producto: ');
		readln(p.codProducto);
		write('Ingrese el codigo del rubro: ');
		readln(p.codRubro);
		writeln('-------------------------------');
	end;
end;


procedure insertarOrdenado(var l:lista; p:producto);
var
	nue: lista;
	act, ant: lista; {punteros auxiliares para recorrido}
begin
	new (nue);
	nue^.dato := p;
	act := l; {ubico act y ant al inicio de la lista}
	ant := l;
	while( act <> nil) and (p.codProducto < act^.dato.codProducto)do
	begin
		ant := act;
		act:= act^.sig;
	end;
	if (act = l) then {al inicio o lista vacía}
		l:= nue
	else {al medio o al final}
		ant^.sig:= nue;
	nue^.sig:= act;
end;

procedure inicializarVectorLista(var vp: vProductos);
var
	i: Integer;
begin
	for i := 1 to 8 do 
		vp[i]:= nil;
end;

procedure cargarProductos(var vp: vProductos);
var
	p: producto;
begin
	leerProducto(p);

	while (p.precio <> 0) do 
	begin
		insertarOrdenado(vp[p.codRubro], p);
		leerProducto(p);
	end;
end;

procedure cargarVectorRubroTres(l: lista; var vr: vRubroTres; var dimL:Integer);
begin
	dimL:= 1;

	while (l <> nil) and (dimL < 30) do 
	begin
		vr[dimL]:= l^.dato;
		dimL:= dimL + 1;
		l:= l^.sig;
	end;
end;

procedure imprimirVectorRubro(vr: vRubroTres; dimL: Integer);
var
	i: Integer;
begin
	for i := 1 to dimL do 
	begin
		writeln('codigo producto # : ',i, ' ', vr[i].codProducto);
		writeln('codigo rubro: ', vr[i].codRubro);
		writeln('Precio: ', vr[i].precio);
		writeln('-----------------------------------------------');
	end;
end;

procedure ordenacionSeleccion(var vr: vRubroTres; dimL: Integer);
var
	i,j,p: Integer;
	item: producto;
begin
	for i := 1 to dimL-1 do 	
	begin
		p:=i;
		for j := i+1 to dimL do 
			if vr[j].precio < vr[p].precio then 
				p:= j;

		item:= vr[p];
		vr[p]:= vr[i];
		vr[i]:= item;
	end;
end;

var
	vp: vProductos;
	vr: vRubroTres;
	dimL: Integer;
begin

	cargarProductos(vp);
	cargarVectorRubroTres(vp[3], vr, dimL);
	writeln();
	writeln('###Imprimo vector rubro###');
	imprimirVectorRubro(vr,dimL);
	ordenacionSeleccion(vr,dimL);
	writeln()
	writeln('###Imprimo vector ordenado###');
	imprimirVectorRubro(vr,dimL);
	readln();
	
end.