create database Agencia;
use Agencia;

#Apartado e la tabla "Personas"
create table Personas
(
	curp   char(18) primary Key,
    nombre varchar(70) not null,
    apellidos varchar(70)not null,
    direccion varchar(150) not null,
    ciudad varchar (30) not null,
    estado varchar(30) not  null,
    telefono char (10) null
);

# apartado de la tabla "Vehiculos"
create table Vehiculo
(
	placa char(7) primary key,
    marca varchar(20) not null,
    modelo varchar(35) not null,
    color char(15) not null,
    numVehiculos varchar(5) not null
);

#apartado de la tabla "Accidentes"
create table Accidentes
(
	numReferencia varchar(20) not null,
    fecha date null,
    lugar varchar(100) not null,
    hora time null
);

#apartado de la tabla "Multas"

create table Multas
(
	lugarInfraccion varchar(150),
    hora date null,
    Fecha date null,
    importe decimal (10,2),
    numReferencia char(20) not null
);

#apartado de "personas"
insert into Personas
(curp, nombre, apellidos, direccion, ciudad, estado, telefono)
values
('sapm040415hgtntra4','Marco Manuel','Santoyo Patiño','Rinconadas del bosque, paseo del madroño n207','Moroleon','guanajuato','4451132855'),
('sauianai0302042jcs','Susana','Lopes Ortega','garibay n403','Moroleon','guanajuato','4451135436'),
('soala09938hdjsncs3','Andres','Sosa Almanza','Rinconadas del bosque, paseo del tule n589','Moroleon','guanajuato','4454628801'),
('juca948534herunvu2','Alejandro','Juares Carranza','pipila n345','Moroleon','guanajuato','4451345620'),
('flvd679986fnjfhuj7','Daniela','Flores Vieyra','defensores de moroleon n803','Moroleon','guanajuato','4457936432');

alter table Personas 
add column email varchar(90);

delete from Personas where nombre = 'Marco Manuel';

#Mostrar tablas
select * from Personas;
describe Personas;
show tables;
#fin de apartado

#apartado de "vehiculos"
insert into Vehiculo
(placa, marca, modelo, color, numVehiculos)
values
('o24bd42','Nissan','Sentra 2017','Negro','1'),
('072bfe2','Ford','Mustang 2018','Gris y Azul','2'),
('903ghj5','Ford','Ranger 1998','Azul','1'),
('723gra2','Chevrolet','Amrillo y Negro','Camaro 2016','2'),
('678gf86','Ferrari','F40 1988','Rojo','1');

#Mostrar tablas
select * from Vehiculo;
describe Vehiculo;
show tables;
#fin de apartado

#apartado de "Accidentes"

drop table Accidentes;

create table Accidentes
(
	numReferencia varchar(20) not null,
    fecha date not null,
    lugar varchar(100) not null,
    hora time not null
);

insert into Accidentes
(numReferencia, fecha, lugar, hora)
values
('98245087y3287wer2321','2016/12/09','Moroleon GTO rumbo a autopista valle de santiago','14:10:32'),
('84763hfn8367735n3873','2017/03/15','Salamanca GTO rumbo a Leon GTO','16:43:43'),
('727352ydh82746276237','2019/06/17','Morelia MICH rumbo a huandacareo','20:32:55'),
('567469h7f3n765b32637','2020/03/15','Victoria de Cortazar rumbo a valle de Santiago','14:16:13'),
('13927h421746324726d7','2021/05/14','Celaya GTO rumbo a isste','15:24:15');

#Mostrar tablas
select * from Accidentes;
describe Accidentes;
show tables;
#fin de apartado

#apartado de Multas
drop table Multas;
create table Multas
(
	lugarInfraccion varchar(150),
    hora time not null,
    Fecha date not null,
    importe decimal (10,2),
    numReferencia char(20) not null
);

insert into Multas
(LugarInfraccion, hora, fecha, importe, numReferencia)
values
('Moroleon GTO rumbo a autopista valle de santiago','14:10:32','2016/12/09','536','98245087y3287wer2321'),
('Salamanca GTO rumbo a Leon GTO','16:43:43','2017/03/15','5478','84763hfn8367735n3873'),
('Morelia MICH rumbo a huandacareo','20:32:55','2019/06/17','435','727352ydh82746276237'),
('Victoria de Cortazar rumbo a valle de Santiago','14:16:13','2020/03/15','4533','567469h7f3n765b32637'),
('Celaya GTO rumbo a isste','15:24:15','2021/05/14','6432','13927h421746324726d7');

update Multas set importe = '536' where importe = 456;

#Mostrar tablas
select * from Multas;
describe Multas;
show tables;
#fin de apartado