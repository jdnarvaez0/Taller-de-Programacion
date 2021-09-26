{12. Implementar un programa que procese la información de las ventas de productos de una
librería que tiene 4 sucursales. De cada venta se lee fecha de venta, código del producto
vendido, código de sucursal y cantidad vendida. El ingreso de las ventas finaliza cuando se
lee el código de sucursal 0.
Implementar un programa que:
a. Almacene las ventas ordenadas por código de producto y agrupados por sucursal,
en una estructura de datos adecuada.
b. Contenga un módulo que reciba la estructura generada en el punto a y retorne
una estructura donde esté acumulada la cantidad total vendida para cada código de
producto}


program ejericicio12;

const
	dimF = 4;

type

	str = String[10];
	rangoSucursal = 0.. dimF;

	venta = record
		fechaVenta : str;
		codProducto : Integer;
		codSucursal : rangoSucursal;
		cantVendida : Integer;
	end;

	regCodigo = record
		codProducto : Integer;
		cantVendida : Integer;
	end;


	lista = ^nodo;
	nodo = record
		dato : venta;
		sig: lista;
	end;

	listaCodigo = ^nodoCod;
	nodoCod = record
		dato : regCodigo;
		sig : listaCodigo;
	end;

	vector = array[1..dimF] of lista;

procedure inicializarVector(var v: vector);
var
	i: Integer;
begin
	for i := 1 to dimF do 
		v[i]:= nil;
end;

procedure leerVenta(var ven: venta);
begin
	write('Ingrese el codigo sucursal: ');
	readln(ven.codSucursal);
	if (ven.codSucursal <> 0) then 
	begin
		write('Ingrese la fecha de la venta: ');
		readln(ven.fechaVenta);
		write('Ingrese el codigo del producto: ');
		readln(ven.codProducto);
		write('Ingrese el la cantida vendida del producto: ');
		readln(ven.cantVendida);
	end;
end;

procedure agregarOrdenado(var l:lista; ven: venta);
var
	nue, ant, act: lista;
begin
	new(nue);
	nue^.dato:= ven;
	act:= l;
	ant:= l;

	while (act <> nil) and (ven.codProducto > act^.dato.codProducto) do 
	begin
		ant:= act;
		act:= act^.sig;
	end;
	if (act = ant) then 
		l:= nue
	else
		ant^.sig:= nue;
	nue^.sig:= act;
end;

procedure cargarVector(var v: vector);
var
	ven: venta;
begin

	leerVenta(ven);
	while (ven.codSucursal <> 0) do 
	begin
		agregarOrdenado(v[ven.codSucursal], ven);
		leerVenta(ven);
	end;
end;

procedure agregarAdelante(var l:listaCodigo; veA: regCodigo);
var
	nue: listaCodigo;
begin
	new(nue);
	nue^.dato:= veA;
	nue^.sig:= l;
	l:= nue;
end;


procedure minimo(var v: vector; var vM: venta);
var
	posMin,i: Integer;
begin
	vM.codProducto:= 9999;
	posMin:= -1;
	for i := 1 to dimF do 
	begin
		if (v[i] <> nil) and (v[i]^.dato.codProducto <= vM.codProducto) then
		begin
			vM.codProducto:= v[i]^.dato.codProducto;
			posMin:= i;
		end;
	end;
	if (posMin <> -1) then 
	begin
		vM:= v[posMin]^.dato;
		v[posMin]:= v[posMin]^.sig;
	end;
end;

procedure merge(v: vector; var lN: listaCodigo);
var
	ventaMIn: venta;
	ventaActual: regCodigo;
begin
	lN:= nil;
	minimo(v,ventaMIn);
	while (ventaMIn.codProducto <> 9999) do 
	begin
		ventaActual.codProducto:= ventaMIn.codProducto;
		ventaActual.cantVendida:= ventaActual.cantVendida + ventaMIn.cantVendida;
		minimo(v,ventaMIn);
	end;
	agregarAdelante(lN, ventaActual);
end;

var
	lN: listaCodigo;
	v: vector;

begin
	inicializarVector(v);
	cargarVector(v);
	merge(v,lN);
	readln();
end.