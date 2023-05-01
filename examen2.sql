-- 1 utilizar los comendos "CREATAE USER y GRANT" para crear un usuario llamado "Alumno"
Drop User alumno@localhost; -- borrarlo si ya existe
Create User alumno@localhost Identified By 'abc123';
Grant all On world To alumno@localhost;
Show Grants For alumnos@localhost;

-- 2 crear un usuario llamado "Docente"con el password "abc123"alter
Drop User docente@localhost; -- borrarlo si ya existe
Create User docente@localhost Identified By 'abc123';
select * from mysql.user;

-- 3 retire los permisos otorgados al usuario "alumno" en el ejercicio num 1
Drop User alumno@localhost;
Revoke Select, Insert On world from alumno@localhost;

-- 4 utilizar los comandos "CREATE USER y GRANT" para hacer un ususario llamado "Directivo"
Create User directivo@localhost Identified By 'abc123';
Grant Delete, Insert On nwind.products To directivo@localhost;
Show Grants for directivo@localhost;

-- 6 Crear una vista que muestre (Clave del producto, clave categoria, nombre categoria, Precio del producto, Cant unidades) con precio menor a 30dls
Use nwind;
Create View Productos As Select p.ProductId, p.ProductName, c.CategoryId, c.CategoryName, p.UnitPrice, p.UnitsInStock From Products p Join Categories c On p.CategoryId = c.CategoryId Where P.unitPrice <= 30;
Select * From Products;
Grant Select, Insert On nwind.products To directivo@localhost;
Show Grants for directivo@localhost;

-- 7 conectarse como root y crear un vista llamada "Orders 1197" y debe mostrar  (clave de la informacion, clave de la orden, fecha de la orden, nombre del sEmpleado  que ha registrado la orden , nombre del cliente que pidio la orden) mostrar las ordenes con fecha del año "1997"
Create View orders1997 As Select O.orderId, O.orderdate, E.FirstName, E.LastName, S.CompanyName, C.contactName From Orders O join Shippers S On O.Shipvia = S.shipperId Join Employees E On O.EmployeeId = E.EmployeeId Join Customers C On O.customerId = C.CustomerId Where Year (OrderDate) = 1997;
Select * From orders1997;

-- 8 Otorgar al user "Alumno" Los permisos para ver la lista Llamada "Orders1997" en una conexion como Alumno y verificar si puede consultar esa vista
Drop User alumno1@localhost; -- borrarlo si ya existe
Create User alumno1@localhost Identified By '123';
Grant Select, Insert On nwind.orders1997 To alumno1@localhost;