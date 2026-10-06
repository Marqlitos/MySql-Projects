create user 'itsur2026'@'192.168.56.1' identified by '12345';

-- Nivel global
grant select on *.* to 'itsur2026'@'192.168.56.1';
grant select,insert, update on *.* to 'itsur2026'@'192.168.56.1';

-- Superusuario
grant all privileges on *.* to 'itsur2026'@'192.168.56.1'
with grant option;

-- Nivel Base de datos
grant select on World.* to 'itsur2026'@'192.168.56.1';

-- Nivel tabla
grant select on World.City to 'itsur2026'@'192.168.56.1';

grant select on World.City to 'itsur2026'@'192.168.56.1'
with grant option;

-- Nivel columna
grant select (id,name) on world.city to 'itsur2026'@'192.168.56.1';


use northwind2;

create view vwNorteamerica as
select customerid, companyname, country 
from customers
where country in ('mexico','usa', 'canada');

select * from vwNorteamerica;

create user 'conta'@'localhost' identified by '1234';
grant select on northwind2.vwNorteamerica to 'conta'@'localhost';

create view vwSuramerica as
select customerid, companyname, country 
from customers
where country in ('mexico','usa', 'canada');

-- Crear una vista que muestre la clave del producto, el nombre del producto, el precio del producto
-- el nombre del proveedor y el nombre de la categoria.
-- en esta vista solo deben aparecer los productos que surten proveedores de estados unidos

describe products;
describe customers;

create view vwProducts as
select p.productid, p.productname, p.unitprice, s.companyname, c.categoryname
from products p  join suppliers s on p.supplierid = s.supplierid
join categories c on c.categoryid = p.categoryid
where s.country = 'USA';
