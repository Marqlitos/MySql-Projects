-- 1 Subconsultas
use northwind2;

select * from employees;
select * from employeeterritories;

describe region;
select e.EmployeeID, e.LastName, e.FirstName, e.Country, et.EmployeeID 
from employees e join employeeterritories et on e.EmployeeID = et.EmployeeID;

-- 2 Group by
describe customers;
describe orders;

select c.CustomerID, c.CompanyName
from Customers c inner join Orders o on c.CustomerID = o.CustomerID
where o.OrderDate >= '1998-05-01' and o.OrderDate < '1998-06-01'
group by c.CustomerID, c.CompanyName;

-- 3 Subconsultas
describe orders;
select * from `orderdetails`;

select o.OrderID, o.OrderDate,
    (
        select count(*)
        from `Order Details` as od
        where od.OrderID = o.OrderID
    ) 
as CantidadDetalles
from Orders as o
order by CantidadDetalles desc;


-- 4
select c.CustomerID, c.CompanyName,
    (
        select count(*)
   e     from Orders as o
        where o.CustomerID = c.CustomerID
          and o.OrderDate >= '1995-01-01'
          and o.OrderDate < '1995-02-01'
    ) 
as OrdenesEnero1995,
    (
        select count(*)
        from Orders as o
        where o.CustomerID = c.CustomerID
          and o.OrderDate >= '1996-01-01'
          and o.OrderDate < '1996-02-01'
    ) as OrdenesEnero1996
from Customers as c;

-- 5
select s.ShipperID, s.CompanyName,
    (
        select count(*)
        from Orders as o
        where o.ShipVia = s.ShipperID
          and o.ShippedDate >= '1996-01-01'
          and o.ShippedDate < '1997-01-01'
    ) as OrdenesEnviadas1996
from Shippers as s;


-- 6 
use northwind2;
select o.orderid, o.orderdate, e.lastname, e.firstname, c.companyname,
count(*) as cantidad_detalles 
from orders o join employees e on e.employeeid = o.employeeid
join customers c on o.customerid = c.customerid
join `order details` od on od.orderid = o.orderid
where o.orderdate between '1998-05-03' and '1998-06-06'
group by o.orderid, o.orderdate, e.lastname,e.firstname, c.companyname;


-- Subconsultas anidadas
select * from products
where productid in (
select productid
from products where categoryid=5
 );

/*
-- Lista de productos de la categoria 5
select productid, productname, unitprice
from products where categoryid=5;
*/

-- Lista de productos que son de USA
select * from products
where supplierid in (
	select supplierid from suppliers
    where country = 'USA'
 );
 
 -- Lista de productos de proveedores de USA
 select * from products
where supplierid not in (
	select supplierid from suppliers
    where country = 'USA'
 );
 
 -- ANY (Cualquiera)
 select * from products
 where unitprice > any (
	select unitprice from products 
    where categoryid = 2 
 );
 
select unitprice from products where categoryid = 2;

-- ALL (Todo)
 select * from products
 where unitprice > all (
	select unitprice from products 
    where categoryid = 2 
 );
 
 -- Seleccionar todos los datos de los productos que cuestan mas que todos los productos 
 -- que surten los proveedores de USA
select * from products
 where unitprice > all (
	select p.unitprice
    from products p 
	join suppliers s on p.supplierid = s.supplierid
    where s.country = 'USA'
 );
 