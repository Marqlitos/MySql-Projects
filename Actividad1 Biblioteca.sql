create database Biblioteca;
use Biblioteca;

create table Alumnos
(
	Control 	char(9)	primary key,
    Apellidos	varchar(45) not null,
    Nombre		varchar(45) not null,
    CURP		char(18)	not null,
    Correo1		varchar(50) not null,
    Correo2		varchar(50)	null,
    Correo3		varchar(50)	null,
    Telefono1	char(10)	null,
    Telefono2	char(10)	null,
    Direccion	Varchar(100)
);
SHOW tables; -- Muestra una lista de tablas que hay en una base de datos 
describe Alumnos; -- Muestra la estructura de la tabla
select * From Alumnos; -- Consulta que muestra los datos de la tabla
Show columns From Alumnos; -- Identico a Describe

-- Insertar datosen la tabla alumnos
Insert into Alumnos
(Control, Apellidos, Nombre, CURP, Correo1, Correo2, Correo3, Telefono1, Telefono2, Direccion)
Values ('898777','Padilla Aguirre','Alejandro','PAA788788','Padilla@cbtis', null, null,'4451282345', null, 'Morelos 23');

select * from Alumnos;
Drop Table Alumnos;

-- Modificar La estructura de la tabla
alter table Alumnos
Add column Genero Enum ('M', 'F');
describe Alumnos;
select * from Alumnos;

-- Cambiar un dato en la tabla
update Alumnos set Genero = 'M' where Control = '898777';

-- Cambiar el telefono2, no es null, debe ser 4459999999.
update Alumnos set Telefono2 = '1232342' where control = '898777';

-- Eliminar un registro
delete from Alumnos where Control='898777';

-- Eliminar columnas de una tabla
alter table Alumnos drop column Correo2;
alter table Alumnos drop column Correo3;
alter table Alumnos drop column Telefono2;
alter table Alumnos drop column Genero;
describe Alumnos;

-- Cambiar la longitud de una columna
alter table Alumnos
change column Apellidos Apellidos varchar(50) not null;
describe Alumnos;

-- Insertar una columna en una posicion especifica
alter table Alumnos add column rfc char(10) null after nombre;
select * from Alumnos;
insert into Alumnos values
('999999','Vazques Almanza','Kevin Manuel','VAAK999','VAAK999','VAAK999','Licgerman@gmail.com','4454545','Hidalgo 25'),
('999999','Vazques Almanza','Kevin Manuel','VAAK999','VAAK999','VAAK999','Licgerman@gmail.com','4454545','Hidalgo 25'), 
('999999','Vazques Almanza','Kevin Manuel','VAAK999','VAAK999','VAAK999','Licgerman@gmail.com','4454545','Hidalgo 25');

select * From Alumnos;