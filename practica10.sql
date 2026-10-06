use northwind2;

select * from suppliers s 
where exists (
select 1
from products p
where p.supplierid = s.supplierid
);

select * from suppliers s
where exists (
select 1
from products p
where p.supplierid = s.supplierid
and p.unitprice > 50
);

select * from customers c 
where exists (
select 1 
from orders o 
where o.customerid = c.customerid
);

select * from customers c
where c.customerid in (
select customerid 
from orders
);

select * from suppliers s 
where exists(
select 1 from products p 
where p.supplierid = s.supplierid
and p.unitprice > 50
);

select * from suppliers
where supplierid in(  
select supplierid from products 
where unitprice > 50
);

-- Ejercicios de tarea
use northwind2;
select * from suppliers;
select * from products;
describe products;
select * from suppliers s
where not exists(
select 1 from products p 
where p.supplierid = s.supplierid
);

-- Ejercicio 2
select s.SupplierID, s.CompanyName
from Suppliers s
where exists (
    select *
    from  Products p
    where p.SupplierID = s.SupplierID
	and p.UnitPrice > 100
);

-- Ejercicio 3
select c.CustomerID, c.CompanyName
from Customers c
where not exists (
    select *
    from Orders o
    where o.CustomerID = c.CustomerID
);

-- Ejercicio 4
select c.CustomerID, c.CompanyName
from Customers c
where exists (
    select *
    from Orders o
    where o.CustomerID = c.CustomerID
	and o.OrderDate >= '1998-01-01'
);

-- Ejercicio 5 World
use world;
select co.code, co.name
from Country co
where exists (
    select *
    from City ci
    where ci.CountryCode = co.Code
      and ci.Population > 500000
);

-- Ejercicio 6
select co.code, co.name
from  Country co
where exists (
    select * from CountryLanguage cl
    where cl.CountryCode = co.code
      and cl.language = 'Spanish'
);

-- Ejercicio 7
select co.code, co.name
from country co
where exists(
    select * from city ci
    where ci.countryCode = co.code
	and ci.Population > 1000000
)
and exists (
    select * from CountryLanguage cl
    where cl.countryCode = co.code
	and cl.language = 'Spanish'
);
