-- Ejemplo de una subconsulta correlacionada
-- Seleccionar la clave de categoria, el nombre de la categoria
-- Y el precio promedio de los productos de esa categoria.

select c.categoryid, c.categoryName, 
(
	select avg(p.unitPrice) from products p
    where p.categoryid = c.CategoryID
) as precioPromedio
from categories c;

-- Realizar la misma pero con goup by
use northwind2;
select s.supplierid, s.CompanyName,
(
select sum (p.unitsinstock)
from products p where p.SupplierID = s.SupplierID
) as stock,
(
select sum (p.unitsinstock * p.unitprice)
from products p where p.SupplierID = s.SupplierID
) as valorTotal,
(
select count(*)
from products p where p.SupplierID = s.SupplierID
and p.UnitsInStock = 0
) as stock
from suppliers s
order by valorTotal desc;