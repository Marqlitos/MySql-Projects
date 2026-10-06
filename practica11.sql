-- Simulacion de examen

-- Ejercicio 1
use world;
select * from country;
select * from city;
select c.name, c.population, lifeexpectancy
from country  c where c.population < 50000;

-- Ejercicio 2
select `code`, `name`, population, GNP from country where continent like '%America' and population > ( select avg(Population) from country where continent = 'Europe' ); 

-- Ejercicio 3
select  e.employeeid as clave_empleado, 
concat(e.firstname, ' ', e.lastname) as nombre_completo,     
(         
select count(*)          
from orders o          
where o.employeeid = e.employeeid            
and o.orderdate >= '1997-01-01'            
and o.orderdate <= '1997-12-31'     ) 
as total_ordenes_1997,     
(         
select count(*)          
from orders o          
where o.employeeid = e.employeeid            
and o.orderdate >= '1997-01-01'            
and o.orderdate <= '1997-06-30'     
) as primer_semestre_1997,     
(         
select count(*)          
from orders o          
where o.employeeid = e.employeeid            
and o.orderdate >= '1997-07-01'            
and o.orderdate <= '1997-12-31'     
) as segundo_semestre_1997,     
(         
select count(*)          
from employeeterritories et          
where et.employeeid = e.employeeid     
) as cantidad_territorios from employees e; 

-- Ejercicio 4
use northwind2;
select * from products;
select * from suppliers;

 select * from products
 where unitprice > any (
	select p.unitprice from products p
    join suppliers s on p.supplierid = s.supplierid
    where country = 'USA'
 );
 
 -- Ejercicio 
 use world;
 select * from country;
 select AVG (c.population) AS population
 from country c where continent = 'America'
 group by c.code, c.name, c.population, c.GNP;
 
select c.code, c.name, c.population, c.GNP, 
(
	select avg(c.population)
) as PromedioPoblacion
from country c
where continent = 'America';