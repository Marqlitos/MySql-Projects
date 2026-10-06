use northwind2;
-- Seleccionar la clave del producto, nombre del producto 
-- precio, clave de la categoria  y nombre de la categoria
-- de aquellos productos que cuestan mas de 20 dls.

select p.productid, p.productname, p.unitprice, c.categoryid,
c.categoryname
from products p join categories c on p.categoryid = c.categoryid
where p.unitprice > 20;


--  #1: Producto cartesiano 
select p.productid, p.productname, p.unitprice, c.categoryid,
c.categoryname
from products p join categories c;

--  #2: Consulta usando USING
select p.productid, p.productname, p.unitprice, c.categoryid,
c.categoryname
from products p join categories c using (categoryid)
where p.unitprice > 20;


-- #3: Consulta usando natural join
select p.productid, p.productname, p.unitprice, c.categoryid,
c.categoryname
from products p natural join categories c
where p.unitprice > 20;

-- #4: consulta sin join
select p.productid, p.productname, p.unitprice, c.categoryid,
c.categoryname
from products p, categories c 
where p.categoryid = c.categoryid
and p.unitprice > 20;

-- union de 3 tablas
select o.orderid, o.orderdate, s.shipperid, s.companyname,
concat(e.lastname, '', e.firstname) as empleado, e.country
from orders o join shippers s on o.ShipVia = s.shipperID
join employees e on o.employeeid = e.employeeid;

select * from orders;


-- seleccionar la clave del territorio, la descripcion del territorio, 
-- y la descripcion de la region a la que pertenece

select t.territoryID, t.territorydescription , r.regionDescription
from territories t join region r on t.regionID = r.regionid;