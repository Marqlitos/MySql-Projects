-- Time Stamp
-- Datos Geoespaciales
-- creacion de tablas a partir de consultas
-- crear bases de datos con el asistente
-- Analizar Srcipts de respaldo

create database TablasMySQL;
use TablasMySQL;

create table lenguajes (
idLenguaje int primary key auto_increment,
Lenguajes varchar (100) not null,
Descripcion text not null,
Fecha_creacion timestamp default current_timestamp,
Fecha_update timestamp default current_timestamp on update current_timestamp
);

insert into lenguajes(Lenguajes, Descripcion)
values ('Kotlin','Competencia de java creado por JetBrains');

insert into lenguajes(Lenguajes, Descripcion)
values ('Java','Lenguaje de alto nivel de Oracle');

select * from lenguajes;
update Lenguajes set Descripcion = 'Lenguaje POO y funcional'
where idLenguaje = 2;

-- Borrar registros
delete from lenguajes where idLenguaje = 1;

-- Tipos de datos Geoespaciales
-- Latitud y Longitud
-- Altitud
-- 20.139710466417892, -101.15070997561214

create table Predial(
idPredial int primary key auto_increment,
descripcion varchar (100),
ubicacion polygon srid 4326
);

insert into Predial (descripcion, ubicacion)
values ('Edificio de tics del itsur', 
ST_geomFromText(
	'Polygon ((
			20.138727187824347 -101.15071386888627,
            20.13857798301628 -101.15085535540328,
            20.138556578095415 -101.15083054497138,
            20.13854272785095 -101.15083926215014,
            20.138537061841483 -101.15082987441916,
            20.13852887760524 -101.15073331490045,
            20.138545246077307 -101.15066961244018,
            20.13856287366067 -101.15061865047197,
            20.138546505190472 -101.15059316948101,
            20.13856979878217 -101.15055830076415,
            20.138600647046935 -101.1505267848085,
            20.138613238173654 -101.15053952530121,
            20.138692562248675 -101.15049593940512,
            20.13873537205021 -101.15067095354176,
            20.138751110944877 -101.15069174066143,
            20.138741667608265 -101.1507152099901,
            20.138727187824347 -101.15071386888627
		))', 4326
    )
);

select * from Predial;

-- hacer la cafeteria