use northwind2;

describe products;
describe region;
select * from territories;

select ProductName, UnitPrice, UnitsInStock 
from products 
where SupplierID = 2 & UnitPrice >= 15.00;

select ProductName,CategoryName
from categories
where continent = 'USA' and 'UK'
order by name asc;
