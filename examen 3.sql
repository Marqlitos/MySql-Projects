-- Problema 1
use nwind;

SELECT C.CustomerId, c.CompanyName, c.Country,
count(*) as CantidadCompras
from Customers C join orders o 
ON c.customerId=o.orderid
where c.country in ('Germany','Canada','Italy') >= 1997
group by c.CompanyName
order by CantidadCompras asc;  


-- problema 2
Use nwind;

create view reporte As
select o.OrderId, o.Orderdate, o.SHIPCOUNTRY, o.FREIGHT, s.COMPANYNAME, 
avg(o.freight) as costo 
from orders o join shippers s on
o.orderid = s.shipperId
group by o.orderid;

select * from reporte;

-- problema 3
use nwind;

create view vistaEmpleados as
select e.employeeId, e.lastname, e.firstname, e.hiredate, e.homephone, 
avg(o.shippedDate) as cantidadOrdenes
from employees e  join orders o on e.employeeId = o.OrderID
where year(e.hiredate)=1997
group by e.employeeId;

drop view vistaEmpleados;

select * from ReporteOrdenes;

-- problema 4

use nwind;

Drop Procedure spcategoria; 

delimiter $$
create procedure spPrecioMaximo(In precioMin int, In precioMax int)
begin 
	select p.productId, p.productName, p.unitPrice, c.categoryname from products p join categories c on p.supplierId = c.categoryId where unitprice between precioMin and precioMax;
end $$
delimiter ;

call spcategoria(25, 30);