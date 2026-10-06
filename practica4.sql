use northwind2;
select * from orders;
select * from employees;
describe employees;

insert into employees (FirstName, LastName) 
values 
('Marco', 'Santoyo patiño');

-- tambien se puede con: insert into employees values () respetando el orden
insert into employees (FirstName, LastName, Title, TitleOfCourtesy, BirthDate, HireDate, Address, City, Region, PostalCode, Country, HomePhone,Extension, Notes, ReportsTo,PhotoPath) 
values 
('Marco', 'Santoyo patiño', 'Programador', 'SR', '2004-04-15', '2026-08-28', 'Rinconadas del bosque', 'Mexico','Mx','38994','MX','4451107914','52','Ingeniero en sistemas computacionales de la carrera de ind de la tecnologia 4.0','3','http://');

insert into employees (FirstName, LastName, Title, TitleOfCourtesy, BirthDate, HireDate, Address, City, Region, PostalCode, Country, HomePhone,Extension, Notes, ReportsTo,PhotoPath) 
values 
('Alex', 'Padilla', 'ing-Sistemas', 'Mr','2004-09-16','2026-08-29','Moroleon','Guanajuato','Mx','38800','Mx','4451132855','52','Ingeniero en sistemas', '3',null),
('Maria', 'Tellez', 'ing-Sistemas', 'Mr','2005-04-17','2026-08-29','Moroleon','Guanajuato','Mx','38800','Mx','4451132855','52','Ingeniero en sistemas', '3',null),
('Manuel', 'Perez', 'ing-Sistemas', 'Mr','2004-09-18','2026-08-29','Uriangato','Guanajuato','Mx', '38800','Mx','4451132855','52','Ingeniero en sistemas', '3',null);

delete from employees where country = 'USA';
describe customers;
select * from products;


