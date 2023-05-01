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
 