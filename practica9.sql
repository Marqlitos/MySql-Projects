-- 1 
use northwind2;
describe customers;
describe products;
describe suppliers;
select * from suppliers;

 select * from products
 where unitprice > all (
	select p.unitprice 
    from products p
    join  suppliers s on p.productid = s.supplierid
    where s.region = 'USA' and p.unitprice >= 20
 );
 
 -- 2
 describe products;
 describe suppliers;
 select * from ;
 
 select p.productid, p.productname, p.unitprice, s.companyname
 from products p join suppliers s on p.productid = s.supplierid
  where unitprice > any (
	select unitprice from products 
    where unitprice > 1 
 );
 
-- 3
describe products;
describe suppliers;
select * from products;
select * from suppliers;

select p.productid, p.productname, s.companyname
from products p
join suppliers s on p.supplierid = s.supplierid
where p.supplierid in (
    select p.supplierid
    from products p
    join categories c on p.categoryid = c.categoryid
    where c.categoryname = 'SEAFOOD'
);

-- 4
use northwind2;
select * from products p
join suppliers s on p.supplierid = s.supplierid
join customers c on s.country = c.country;

-- 5
select p.productid, p.productname, 
COUNT(od.productid), p.unitprice
from products p
join `order details` od on p.productid = od.productid
GROUP BY p.productid, p.productname, p.unitprice;