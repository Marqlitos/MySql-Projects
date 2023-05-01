-- ejercicio 28/10/21
use nwind;
select * from products where unitprice <10;

-- apagar modo seguro
set SQL_SAFE_UPDATES = 0;

update products set unitprice = unitprice - unitprice * 0.1 where unitprice < 10;



-- usuarios y permisos en my sql
-- crear un usuario nuevo
create user zurita@localhost identified by '12345';
grant select on nwind.categories to zurita@localhost;

-- comprobar que el usuario si se creo
select * from mysql.user;

-- comprobar permisos de un ususario
show grants for zurita@localhost;

-- levels.fyi