-- 3
use nwind;
select * from products;
-- verificando que puede seleccionar 

-- 4
-- verificando que puede insertar
insert into products values (null, 'proyacto OPTOMA',1,1,'1', 8500, 10,1,20,0);
update products set unitprice = 1500 where productid = 100000;