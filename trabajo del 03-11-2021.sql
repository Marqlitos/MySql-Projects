use its;
select * from alumnos;
insert into alumnos values ('41','Marco Santoyo');
insert into alumnos values ('42','Marqlitos');

-- funciones de hash
select MD5('Ya Es Hora De Irnos');
select sha1('X');
select sha2('Hay Examen De Bases De Datos Este Fin De Semana','256');

create database cbtis217;
use cbtis217;
create table usuarios
(
	id int primary
);
