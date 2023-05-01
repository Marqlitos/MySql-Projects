-- Consltas basicas en sql
-- Area para escribir
-- fecha de creacion "13/10/2021"

show databases; -- muestras la lista de base de datos
use escuela_compu; -- elijes la base de datos
show tables; -- muestra las tablas de la bd actual
describe alumnos; -- muestra la estructura de la tabla actual

-- selecciona todos los datos en la tabla
select * from alumnos;

-- filtrar columnas
select nombre, fecha_nac from alumnos;

-- filtrar renglones
select * from alumnos where faltas >=10;  -- se puede usar ">","<","="

-- alumnos del curso 1 con mas de 20 faltas
select * from alumnos where curso =1 and faltas >=20;


-- trabajo en clase 14/10/2021
-- Ejercicio1, 
use world;
select * from country;

-- Ejercicio 2 
select * from country where region in ('caribean');

-- Ejercicio 3
select * from country where LifeExpectancy >= 75;

-- Ejercicio 4
select * from country where SurfaceArea >= 500000;

-- Ejercicio 5
select * from country where IndepYear >=1900 and IndepYear <=1940;

-- Ejercicio 6
use nwind;
select * from employees;
select LastName,FirstName,TitleOfCourtesy, 'mr' from employees;

-- trabajo en clase 18/10/2021
use nwind;

-- Comparacion de cadenas
select * from Products;
select * from products where productname like 'chai';

-- productos que inician con la letra "C"
select * from Products;
select * from products where productname like 'c%';

-- productos que inician con la letra "CH"
select * from Products;
select * from products where productname like 'CH%';

-- Productos que terminan con la letra "S"
select * from Products;
select * from products where productname like '%S';

-- Productos que tienen una letra "A" en el segundo caracter
select * from Products;
select * from products where productname like '_A';

-- Productos que tienen una letra "A" en el segundo caracter
select * from Products;
select * from products where productname like '% C%';

-- productos que no inician con la letra "A"
select * from Products;
select * from products where productname not like 'A%';

-- uso de Between ==========
select productid, productname, unitprice from products where unitprice between 12 and 17;
select productid, productname, unitprice from products where unitprice >= 12 and unitprice <=17;
select orderdate between '1997-01-01' and '1997-01-05';

-- El in es una alternativa a varios or
select * from customers where country in ('Mexico','Germany','Usa');
select * from customers where country = 'Mexico' or country = 'germany' or country = 'usa';

-- Uso del order by 
select * from products order by unitprice desc;
select * from products order by unitprice asc;
select * from products order by unitprice ;
select * from products order by 6 ;

-- ordenar por columnas
select * from products order by categoryid, unitprice desc;

-- trabajos 19/10/2021
use nwind;
select productid, productname, unitprice, unitprice * 1.16 from products;

-- Max, Min, Avg, Sum, Count, Stdev
select producname, unitprice from products;
select max(unitprice) from products;
select min(unitprice) from products;
select max(unitprice), min(unitprice) from products;

-- contar cuantos productos hay en la tabla
select count(productid) from products;

-- sumar los precios de todos los productos 
select sum (productid) from products;
-- -- -- -- -- -- -- -- -- -- --
use world;
select city.name, city.population, country.name from city join country on city.countrycode = country.code;

-- -- -- -- -- -- -- -- -- -- --
use nwind ;
select products.productname, products.unitprice, suppliers.CompanyName from products join suppliers on products.supplierid = suppliers.supplierid;

-- Seleccionar la clave de la orden, el costo de envio (freight)  la clave del empleado y  el nombre del empleado que reguistro la orden.
use nwind;
select o.orderid, o.orderdate, o.freight, e.employeeid, e.firstname, e.lastname from employees e join orders o on e.employeeid = o.employeeid;

-- pk = primary key, fk = foreign key
select c1,c2,c3 from t1 join t2 on t1.pk = t2.fk;

-- selecciona la clave de la orden de la fecha de la orden, la clave del cliente (customer), el nombre del cliente(customer.companyname), el pais del cliente
select o.orderid, o.orderdate, c.customerid, c.CompanyName, c.country from customers c join orders o on c.CustomerId = o.OrderId;

-- seleccionar la clave del producto, el nombre del producto, el precio del producto,  la clave de la categoria a la que pertenece y el nombre de la categoria
select p.productid, p.productname, p.unitprice, c.categoryid, c.categoryname from products p join categories c on p.categoryid = c.categoryid;

-- seleccionar la clave de la orden, fecha de la orden, fecha de envio(shippeddate), nombre de la compañia de envios

-- Ejemplo de llamar las tablas
select c1,c2,c3 from t1 join t2 on t1.pk = t2.fk;

-- tareas del 21-10-2021

-- 1.- (Nwind) Seleccionar los clientes que compraron productos de la categoría 'Grains/Cereals’ durante los primeros 10 días del mes de mayo de 1997.
use nwind;
select c.customerId, c.companyName, c.contactName from customers c join categories z join orders o on o.customerId = c.customerId where z.categoryName = 'grains/Cereals' and o.requiredDate > '1997-05-01' and o.requiredDate < '1997-05-10';

-- 2.- (Nwind) Seleccione la clave de la orden, la fecha de la orden, el nombre del empleado, el apellido del empleado y el nombre del cliente. Se deben presentar solamente los clientes que son de México, Canadá o Estados Unidos.
use nwind;
select o.orderId, o.OrderDate, e.FirstName, e.LastName, c.companyName from customers c join orders o on o.customerId = c.customerId join employees e on o.employeeId = e.employeeId where c.country in ('Mexico', 'Usa', 'Canada');

-- 3.- (Nwind) Genere una consulta que muestre los productos de los proveedores de España o Italia que cuestan más de 20 dls. Las columnas que se deben presentar son: clave del producto, nombre del producto, precio del producto, nombre del proveedor y país del proveedor.
use nwind;
select p.productid, p.productname, p.unitprice, s.companyName, s.Country  from products p join suppliers s on s.supplierid = p.supplierId;

-- 4.- (World) Ciudades con nombres raros. Se desea tener una lista con las ciudades que tienen un nombre que comienza con ‘X’, ‘Y’ o ‘Z’. Esta lista debe tener el nombre de la ciudad, el nombre del país y el continente.
use world;
select c.Name, a.Name, a.continent from city c join country a on c.countryCode = a.Code where c.Name like 'X%' and c.Name like 'Y%' and c.name like 'Z%';

-- 5.- (World) Debemos generar una lista de ciudades que nos solicitaron unos viejitos jubilados que quieren irse a vivir a un país con una buena expectativa de vida y en ciudades pequeñas. Seleccione las ciudades que tengan menos de 50,000 habitantes que se encuentren en un país que tenga una expectativa de vida (LifeExpectancy) mayor a 75 años. Los datos a presentar en esta lista son: Nombre de la ciudad, Población de la ciudad y Expectativa de vida.
use world;
select c.Name, c.Population, a.Lifeexpectancy from city c join country a on c.countryCode = a.code where c.population < '50000' and a.lifeexpectancy > 75;
 
-- 25/10/21
-- crear un reporte que muestre  la lista de las ordenes de 1998 (orderdate)
-- los datos a mostrar son los siguientes: la clave de la orden, fecha de la orden, 
-- fecha de envio  (shippedDate), nombre de la compañia de envio,
-- clave de la compañia de envio, clave del cliente, nombre del cliente

use nwind;
select o.orderID, o.orderDate, o.shippedDate, s.companyName c_envios, s.shipperId, c.companyName Cliente from orders o join customers c on o.customerId join shippers s on s.shipperId = shipvia;


-- --------------------------------------------------------------------------------------------------------------------------------------------
-- Crear un reporte alterue muestre una lista de productos 
-- Consideraciones
-- Se solicita: clave del producto, nombre del producto, precio del producto, 
-- nobre del proveedor (companyname), pais del proveedor, nombre de la categoria
-- * Interesan solos los productos cuyo proveedor es de argentina, Brasil o mexico
use  nwind;
select p.productId, p.productname, p.unitprice, s.companyname, s.country, c.categoryname from products p join suppliers s on s.supplierId = p.supplierId join categories c on p.categoryId = c.categoryID where s.country in ('Brasil','Argentina','Mexico');

-- trabajos del 26/10/2021
use world;
-- insertar un registro
-- manera 1
select * from city (ID, name, CountryCode, District, Population) values (Null, 'Uriangato','MEX','Guanajuato',61424);

-- Manera 2
select * from city (ID, name, CountryCode, District, Population) values (Null, 'Uriangato','MEX','Guanajuato',61424);

select * from city;
select * from city; -- id=4086

-- verificando que si se actualizo 
update city set population = 50300 where Id = 4086;

-- eliminar moroleon 
delete from city where Id = 4086;
delete from city where Id > 4086;

-- cambiar el nombre a godzila
-- con 100 habitantes 
-- ciudad con ID=1534
update city set name = 'Godzila', population = 100 where id = 1534;
-- ejercicio 28/10/21
use nwind;
select * from products where unitprice <10;

-- apagar modo seguro
set SQL_SAFE_UPDATES = 0;

update products set unitprice = unitprice - unitprice * 0.1 where unitprice < 10;



-- usuarios y permisos en my sql
-- crear un usuario nuevo
create user zurita@localhost identified by '12345';
grant select on nwind.categories to zurita@localhost;

-- comprobar que el usuario si se creo
select * from mysql.user;

-- comprobar permisos de un ususario
show grants for zurita@localhost;

-- levels.fyi



-- tareas 2.3
-- ejercicio 1
use world;
select * from city;
Insert Into city (Id, Name, CountryCode, District, Population) Values (null, 'Yuriria', 'MEX', 'Guanajuato', 63447);
Insert Into city Values (null, 'Uriangato', 'MEX', 'Guanajuato', 59305);
Insert Into city Values (null, 'Valle de Santiago', 'MEX', 'Guanajuato', 150054);

-- ejercicio 2
Update Country Set HeadOfState='Andrés Manuel López Obrador Papi Amlo', Population = 131492121 Where Code='MEX';
select * from country;

-- ejercicio 3
Use nwind;
Select * From products;
Insert Into Products Values(null,'Gansito',1,2,'50gr',14,24,91,7,1);
Insert Into Products Values(null,'Fuze Tea',3,8,'600 ml',16,58,48,2,0);
Insert Into Products Values(null,'Sabritas',5,3,'340gr',34,78,34,1,7);
Insert Into Products Values(null,'Crepa-Pizza',2,6,'250gr',54,12,3,0,0);
Insert Into Products Values(null,'Pop-Tea Moras',1,8,'50gr',49,26,46,0,1);

-- ejercicio 4
Select * From Products;
Delete From Products Where ProductId=96;
Delete From Products Where ProductId=95;

-- ejercicio 5
Use nwind;
Select * From employees;
Insert Into employees Values(null,'Padilla','Alex',' El Don comedias','Mr','2003-12-02 00:00:00','2015-08-11 00:00:00','Uriangarranch','Moroleon',null,'38800','MEX','(445)113-2855','4352',null,'El turnleftu','1',null);
Insert Into employees Values(null,'Fonseca','Mane','El señor fonseca','Mr','2005-04-16 00:00:00','2014-05-14 00:00:00','Uriangarranch','Uriangato',null,'38800','MEX','(445)113-2855','4352',null,'Es el novio de la señora cerritos (Ivon)','2',null);
Insert Into employees Values(null,'Santoyo','Marqlitos','el futuro señor Romero XD','Ms','2004-04-15 00:00:00','2016-12-24 00:00:00','Rinconadas','Moroleon',null,'38994','MEX','(445)113-2855','4352',null,'Me puse fitnness pa la japo XD no diga nada usted profe XDXD','1',null);

-- ejercicio 6
Use nwind;
Select * From Products Where UnitPrice >= 100;
set SQL_SAFE_UPDATES = 0;
Update Products Set UnitPrice = UnitPrice + UnitPrice * 0.2 Where UnitPrice >=100;

-- Ejercicio de creacion de ususarios 

-- 1. Crear un usuario
Drop User cbtis@localhost; -- borrarlo si ya existe
Create User cbtis@localhost Identified By '123';
-- Despues del '@' se indica desde que lugar se podra conectar el usuario

-- 2. Otorgar permisos a un usuario
Grant Select, Insert On nwind.products To cbtis@localhost;
Show Grants For cbtis@localhost;

-- quitar un permiso
Revoke Select, Insert On nwind.products From cbtis@localhost;
-- 3. Conectarse con ese usuario

-- 4. Comprobar los permisos

-- 5. crear una vista y otorgarle permisos
Create View ProductosMayores As
Select p.ProductId, p.UnitPrice, c.CategoryName, s.CompanyName From  Products p Join Categories c On p.CategoryId = c.CategoryId
Join Suppliers s On s.SupplierId = p.SupplierId Where p.UnitPrice >20;

Select * From ProductosMayores;

Grant Select On nwind.ProductosMayores To cbtis@localhost;

-- funciones de hash
select MD5('Ya Es Hora De Irnos');
select sha1('X');
select sha2('Hay Examen De Bases De Datos Este Fin De Semana','256');

-- funciones de hash
select MD5('Ya Es Hora De Irnos');
select sha1('X');
select sha2('Hay Examen De Bases De Datos Este Fin De Semana','256');

-- funciones de hash
select MD5('Ya Es Hora De Irnos');
select sha1('X');
select sha2('Hay Examen De Bases De Datos Este Fin De Semana','256');


-- examen 2
-- 2
create user docente@localhost
select * from mysql.user;
show grants for cbtis@localhost;
where year (orderdate)=1997 and month (orderdate)=1;

-- procedimientos almacenados

use world;
DELIMITER $$
Create Procedure spPaisesEuropeos() 
Begin 
	Select Code, Name, population, surfacearea
    From Country Where continent = 'Europe';
End $$

DELIMITER ;
Call spPaisesEuropeos();
-- ---------------------------------------------
DELIMITER $$
Create Procedure spPaisesPorContinente(IN continenete Varchar (50))
Begin 
	Select Code, Name, population, SurfaceArea
    From Country Where continent = continente;
End$$
DELIMITER ;
Call spPaisesPorContinente('North America');

-- Ejercicio
-- Crear un oricedimiento que muestre las ordenes de un mes y un año .
-- debe recibir dos parametros de entrada: MES Y AÑO.
--  Mostrar todos los datos de las ordenes de ese periodo

DELIMITER $$
Create Procedure spPaisesPorContinente(IN continenete Varchar (50))
Begin 
	Select Code, Name, population, SurfaceArea
    From Country Where continent = continente;
End$$
DELIMITER ;
Call spPaisesPorContinente('North America');


-- 11-11-21
-- Ejercicio1: Sp con parametros
-- crear un procedimiento que muestre todos los datos con los paises que tienen un tamaño (Surfacearea)
-- de entre un valor inferior y un valor superior
-- parametros de entrada: valor interior, valor superior
 
Drop Procedure spPaisesPorArea; -- Eliminar si ya existe
use World;
delimiter $$
create procedure spPaisesPorArea(In areaMin int, In areaMax int)
begin 
	select * from country where SurfaceArea between areaMin and areaMax;
end $$
delimiter ;

call spPaisesPorArea(100000, 2000000);

-- Ejercicio 2 Sp Productos en un rango
-- crear un procedimiento almacenado que muestre 
-- la clave del producto, el nombre del producto,
-- el precio del producto y 
-- el nombre del proveedor (suppliers.companyName)
-- de aquellos productos cuyo precio se encuentra en un
-- determinado rango
-- paraetros de entrada: precio minimo, precio maximo

Drop Procedure spPrecioMaximo; -- Eliminar si ya existe
use nwind;
delimiter $$
create procedure spPrecioMaximo(In precioMin int, In precioMax int)
begin 
	select p.productId, p.productName, p.unitPrice, s.companyName from products p join suppliers s on p.supplierId = s.supplierId where unitprice between precioMin and precioMax;
end $$
delimiter ;

call spPrecioMaximo(45, 50);

select sum (unitprice) from products where categoryId = 2;
-- SUM , MAX, MIN, COUNT, AVG, STDEV

select count (unitprice) from products where categoryId = 2;

select max (Orderdate) from orders;
select min (Orderdate) from orders;

-- funciones de agregado (agrupacion)
-- max, min, sum, count, avg, stdev

-- ejemplo de uso de estas funciones
-- reporte que muestre el nombre del cliente 
-- y la cantidad de compras que ha hecho
-- en 1997
-- ordenar el resultado por cantidad de compras -- de mayor a menor
use nwind;
select c.CustomerId, c.CompanyName, c.Country, 
count(*) as CantidadCompras from Customers C join Orders O 
on c.CustomerId = o.CustomerId where year (o.Orderdate) = 1997 
group by c.CustomerId order by CantidadCompras desc;
-- ------------------------------------------------------------------
use nwind;
select c.country, 
count(*) as CantidadCompras from Customers C join Orders O 
on c.CustomerId = o.CustomerId where year (o.Orderdate) = 1997 
group by c.CustomerId order by CantidadCompras desc;

-- --------------------------------------------------------------------------------
-- Mostrar una lista de proveedores (Spliers)
-- y la cantidad de cada proveedor
select s.SupplierId, s.CompanyName, s.Country, count(*) 
as Productos from suppliers S join products P 
on s.SupplierId = p.SupplierId group by s.SupplierId;

-- ejercicios 1
-- 1 mostrar la clave de la categoria , el nombre de la categoria y la cantidad de productos
-- que pertenecen a la categoria y la cantiddad de productos
-- que pertenece en esa categoria 

use nwind;
select c.CategoryId, c.CategoryName, c.description,
count(*) as Productos from categories C join Products P 
on c.categoryId = p.categoryId 
group by c.categoryId;

-- ejercicio 2 
-- mostrar la clave de la categoria  el nombre de la categoria 
-- la descripcion de la categoria, el precio maximo de los productos de la cateegoria , el precio minimo de los productos
-- de la categoria

SELECT c.CustomerId, c.CompanyName, c.Country,
AVG(o.Freight) PrecioPromedio
FROM Customers c JOIN Orders o
ON c.CustomerId = o.CustomerId
group by c.CustomerId;

-- ejercico 3
-- el pais del cliente el precio promedio del costo de envio 
-- de las ordenes solicitadas por cada cliente 
-- nota: el costo de envio es la columna freight de la tabla orders

create view reporteClientes as
select c.customerId, c.companyName, avg(o.freight) as precio
from customers c join orders o on o.customerId = c.customerId
group by c.customerId;

select * from ReporteClientes;

-- Crear una vista que muestre la clave de la 
-- compañia de envio (shippers), el nombre de la compañia de envios,
-- la cantidad de ordenes que fueron enviadas 
-- por esa compañia

create view vistaCompania as
select c.customerId, c.companyName, avg(o.freight) as precio
from customers c join orders o on o.customerId = c.customerId
group by c.customerId;

select * from ReporteClientes;



-- tercer parcial

use nwind;
select c.CategoryId, c.CategoryName,
(
   select count(*) from Products p
   where p.CategoryId=c.CategoryId
 )as Cantidad
from Categories c;

-- --------------------------------------
select c.CategoryId, c.CategoryName,
(
	select avg(p.unitprice) from Products p
    where p.CategoryId=c.CategoryId
) as Cantidad,
(
	select max(p.unitprice) from Products p
    where p.CategoryId=c.CategoryId
) as Cantidad,
(
	select min(p.unitprice) from Products p
    where p.CategoryId=c.CategoryId
) as Cantidad
from Categories c;

-- 23/11/2021 ejercicio 
-- selecionar la clave del pais, el nombre del pais 
-- el continente , el tamaño del pais 
-- y la cantidad de cuidades que tienen el pais 
Use world; 
Select p.Code, p.Name, p.Continent, p.Surfacearea,
(
	Select Count(*) From City c
    Where c.CountryCode = p.Code
) As Ciudades
From Country p;

-- 
Use world; 
Select p.Code, p.Name, p.Continent, p.Surfacearea,
(
	Select Count(*) From City c
    Where c.CountryCode = p.Code
    And c.Population > 1000000
) As Ciudades
From Country p;  

-- ejercicio con contienentes
Use world; 
Select p.Code, p.Name, p.Continent, p.Surfacearea,
(
	Select Count(*) From City c
    Where c.CountryCode = p.Code
    And c.Population >= 1000000
) As Ciudades
From Country p
Where p.continent in ('Europe','Asia'); 








