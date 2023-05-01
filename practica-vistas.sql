-- ejercicio 1
use nwind;
create view reporteOrdenes as
select o.OrderId, o.OrderDAte, concat(e.LastNAme, '', e.FirstNAme) as empleado, c.CompanyName,
sum(od.UnitPrice) as Monto From orders o join employees e on o.employeeId = e.employeeId
join customers c on c.CustomerId = o.CustomerId
join `order details` od on od.orderId = o.OrderId where year(o.OrderDate)=1997
and month (o.OrderDate) <=3
group by o.OrderId;

select * from reporteOrdenes;
drop view reporteOrdenes;

-- ejercicio 2
drop view reporteClientes;
create view reporteClientes as
select c.CustomerID,c.CompanyName,o.OrderDate,count(*) as CantidadOrdenes
from customers c join orders o 
on c.CustomerID=o.CustomerID 
where month(o.OrderDate)<=6 and year(o.OrderDate)=1997
group by c.CustomerID;

select * from reporteClientes;

-- ejercicio 3
use nwind;
create view listaColumnas as
select e.employeeId, e.FirstName, e.LastName, c.employeeId,territoryId from employeeterritories c join employees e where SurfaceArea between areaMin and areaMax;

select * from listaColumnas;

-- ejercicio 4
create view vistaCliente as
select c.CustomerId, c.CompanyName, c.Country, 
count(*) as CantidadCompras from Customers C join Orders O 
on c.CustomerId = o.CustomerId where QUARTER(order_time)=QUARTER(NOW()) = 1997 
group by c.CustomerId order by CantidadCompras desc;

select * from vistaCliente;

-- ejercicio 5
use nwind;
delimiter $$
create procedure OrdenesPorYear(In a int)
Begin
select e.EmployeeId, e.LastName, e.FirstName, e.Country, count(*) as ordenes
from employees e join orders o on e.employeeID = o.employeeId
where year (o.orderdate) = 1996
group by e.employeeId;
End $$
Delimiter ;

call OrdenesPorYear(1997);
 