create database club_programacion;
use club_programacion;

create table estudiantes (
id int auto_increment primary key,
matricula varchar (20) unique,
nombre varchar (100), 
correo varchar (100) unique,
edad int check (edad >= 15 and edad <= 60),
semestre int check (semestre >= 1 and semestre <= 12),
nivel enum('Principiante', 'Intermedio', 'Avanzado', 'Experto'),
lenguaje set ('C','C++', 'C#','Java','Python','JavaScript','PHP'),
informacion JSON
);

insert into estudiantes (matricula, nombre, correo, edad, semestre, nivel, lenguaje, informacion)
values
('A001', 'Juan Perez', 'juan@correo.com', 19, 4, 'INTERMEDIO', 'C++,JAVA', '{"ciudad":"Uriangato","equipo":"Equipo1", "rating": 1200}'),
('A002', 'Maria Lopez', 'maria@correo.com', 21, 6, 'AVANZADO', 'PYTHON,JAVASCRIPT', '{"ciudad":"Moroleon","equipo":"Equipo2", "rating": 1450}'),
('A003', 'Carlos Ruiz', 'carlos@correo.com', 18, 2, 'PRINCIPIANTE', 'C', '{"ciudad":"Uriangato","equipo":"Equipo3", "rating": 1100}'),
('A004', 'Ana Gomez', 'ana@correo.com', 22, 8, 'EXPERTO', 'JAVA,PYTHON,PHP,C++', '{"ciudad":"Yuriria","equipo":"Equipo1", "rating": 1600}'),
('A005', 'Luis Silva', 'luis@correo.com', 20, 5, 'INTERMEDIO', 'JAVASCRIPT,PHP', '{"ciudad":"Moroleon","equipo":"Equipo2", "rating": 1350}');

select * from estudiantes;
select nombre, correo, informacion from estudiantes;


insert into estudiantes (matricula, nombre, correo, edad, semestre, nivel, lenguaje, informacion) 
values ('A006', 'Marco ', 'f1@correo.com', 10, 5, 'PRINCIPIANTE', 'C', '{}');
insert into estudiantes (matricula, nombre, correo, edad, semestre, nivel, lenguaje, informacion) 
values ('A007', 'Marco', 'f2@correo.com', 70, 5, 'PRINCIPIANTE', 'C', '{}');
insert into estudiantes (matricula, nombre, correo, edad, semestre, nivel, lenguaje, informacion) 
values('A008', 'Marco', 'f3@correo.com', 20, 0, 'PRINCIPIANTE', 'C', '{}');
insert into estudiantes (matricula, nombre, correo, edad, semestre, nivel, lenguaje, informacion) 
values ('A009', 'Marco', 'f4@correo.com', 20, 15, 'PRINCIPIANTE', 'C', '{}');

select * from estudiantes where nivel = 'Intermedio';
select * from estudiantes where nivel = 'Avanzado';
select * from estudiantes where nivel in ('Principiante', 'Intermedio');

select * from estudiantes where find_in_set('Java', lenguaje) > 0;
select * from estudiantes where FIND_IN_SET('PYTHON', lenguaje) > 0;
select * from estudiantes where FIND_IN_SET('C++', lenguaje) > 0;
select * from estudiantes 
where FIND_IN_SET('JAVA', lenguaje) > 0 
and FIND_IN_SET('PYTHON', lenguaje) > 0;

insert into estudiantes (matricula, nombre, correo, edad, semestre, nivel, lenguaje, informacion)
values ('A010', 'Prueba Rust', 'rust@correo.com', 20, 5, 'INTERMEDIO', 'RUST', '{}');

select nombre , correo, informacion from estudiantes;

select nombre, informacion ->> '$.ciudad' as ciudad from estudiantes;
select nombre, informacion ->> '$.equipo' as equipo from estudiantes;
select nombre, informacion ->> '$.rating' as rating from estudiantes;

select * from estudiantes where informacion ->> '$.ciudad' = 'Uriangato';
select * from estudiantes where informacion ->> '$.equipo' = 'Equipo';
select * from estudiantes where CAST(informacion->>'$.rating' as unsigned) > 1300;

UPDATE estudiantes 
SET informacion = JSON_SET(informacion, '$.edad', 19) 
WHERE id = 1;

update estudiantes 
set informacion = JSON_SET(informacion, '$.universidad', 'ITSUR', '$.experiencia', 2, '$.puntos', 150) 
where id = 2;

update estudiantes 
set informacion = JSON_SET(informacion, '$.rating', 1350) 
where id = 1;

select nombre, informacion from estudiantes where id = 1;
update  estudiantes 
set informacion = JSON_SET(informacion, '$.equipo', 'Equipo3') 
where id = 4;

update estudiantes 
set informacion = JSON_REMOVE(informacion, '$.experiencia') 
where id = 2;
update estudiantes 
set informacion = JSON_REMOVE(informacion, '$.puntos') 
where id = 2;

update estudiantes 
set informacion = JSON_SET(informacion, '$.rating', CAST(informacion->>'$.rating' as unsigned) + 100) 
where informacion->>'$.equipo' = 'Equipo1';