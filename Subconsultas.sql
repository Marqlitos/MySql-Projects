/* EJERCICIO 1 WORLD
Seleccionar el nombre del país, el tamaño (surfacearea), la
población del país (population) y la cantidad de lenguajes que
hablan en el país.
Solo mostrar los países de Oceanía que tienen más de 10,000
habitantes. */
Use world;
Select c.name, c.surfaceArea, c.population,
(
	Select count(*) From countryLanguage cl 
    Where cl.countryCode = c.Code 
) As lenguas
From country c Where c.continent = 'oceania' And 
c.population > 10000;

/*  EJERCICIO 2 - NWIND
Seleccione proveedor
(suppliers.companyname), el país del proveedor (country), la
ciudad del proveedor, la cantidad de productos que surte cada
proveedor y el precio promedio de los productos que surte el
el nombre del proveedor.
Debe ordenar los resultados por el precio promedio de mayor a menor.
NOTA: El precio promedio debe aparecer redondeado a
decimales */

Use nwind; 
Select s.companyName, s.country, s.city,
(
	Select count(*) From products p 
    Where p.supplierId
) As cantidadDeproductos,
(
	Select Avg(round(p.unitPrice,2))
    From products p
    Where p.supplierId = s.supplierId
) As Promedio From suppliers s order by(CantidadDeProductos);

/* EJERCICIO 3 - NWIND
Seleccionar la clave de la orden, la fecha de la orden, el
nombre del empleado, el apellido del empleado, el nombre del
cliente.
Se deben seleccionar solo las órdenes de mayo de 1997 que
tienen más de 3 productos en su detalle de venta. */
use nwind;
Select o.orderId, o.orderDate, 
(
	Select concat(e.firstName,'',e.lastName) from employees e where
    o.employeeId=e.employeeId
) as Nombre_Empleado,
(
	Select c.companyName from customers c
    Where o.customerId=c.customerId
) as Nombre_Cliente
From orders o join `order details` od on 
Od.orderId=o.orderid where year(o.orderDate)=1997 and od.quantity>3;



/*  EJERCICIO 4 - NWIND
Seleccionar la clave del cliente, el nombre del cliente, el país
del cliente y la cantidad de órdenes que solicitó en 1997. */
use nwind;
Select c.customerId, c.companyName, c.country,
(
	Select count(o.orderdate) from orders o
    Where o.customerId=c.customerId
) as Ordenes
From customers c;

/*  EJERCICIO 5 - WORLD
Seleccionar el nombre del CONTINENTE, la cantidad de países
del continente, el promedio de habitantes por país del
continente, el total de habitantes del continente, el GNP
promedio de los países del continente.
Ordenar los resultados primero por total de habitantes de
manera descendente. */

use world;
Select distinct c1.continent, 
(
	Select count(*) from country c2
    Where c2.continent=c1.continent
) as Cantidad_Paises,
( 
	Select round(avg(c2.population), 2) from country c2
    Where c2.continent=c1.continent
)as Promedio, 
(
	Select sum(c2.Population) from country c2
    Where c2.continent=c1.continent
)as Habitante,
( 
	Select round(avg(c2.GNP), 2) from country c2
    Where c2.continent=c1.continent
)as GPN_Promedio
From country c1 ;







