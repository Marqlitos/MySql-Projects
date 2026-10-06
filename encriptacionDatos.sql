drop database mercado_libre;
create database mercado_libre;
use mercado_libre;

create table usuarios(
id int primary key auto_increment,
userName varchar(50) not null,
Nombre varchar(50) not null,
Apellidos varchar(50) not null,
contraseña varchar (128) not null,
email varchar(100) not null
);


create table usuarios(
id int primary key auto_increment,
userName varchar(50) not null,
Nombre varchar(50) not null,
Apellidos varchar(50) not null,
contraseña varchar (128) not null,
email varchar(100) not null,
n_tarjeta blob null,
ccv blob null
);

drop table usuarios;
describe usuarios;

insert into usuarios values
(null, 'Marck', 'Marco Manuel', 'Santoyo Patiño',
sha2('abc123', 512),'marco.manuel1504@gmail.com');
select * from usuarios;

insert into usuarios values
(null, 'Nopesep', 'Juan Manuel', 'Lopez Almanza',
sha2('Nope123', 512),'example@gmail.com');

insert into usuarios values
(null, 'Ice', 'Icela', 'Diaz',
sha2('Ice-2', 512),'example2@gmail.com');

-- Funcion Reversible: tiene una forma de desencriptar
select aes_encrypt('889', 'miLlavePrivada$#@!');

-- Funcion para desencriptar
select aes_aes_encrypt();
select aes_decrypt('889', 'miLlavePrivada$#@!'),
 'miLlavePrivada$#@!';
 
 -- Dar acceso
 select * from usuarios
 where usarname = 'Nopesep' and password = 'abc123';
 
 select * from usuarios
 where usarName = 'Ice' and password = sha2('Ice-2', 512);
 
 describe usuarios;
 insert into usuarios values
(null, 'Marck', 'Marco Manuel', 'Santoyo Patiño',
sha2('abc123', 512),'marco.manuel1504@gmail.com',
aes_encrypt('5654065107','ClavePrivada123'),
aes_encrypt('567','ClavePrivada123')
);

-- Desencriptar
select * from usuarios;
select usarname, nombre,
aes_decrypt(nTarjeta, 'ClavePrivada123'),
aes_decrypt(ccv, 'ClavePrivada123')
from usuarios;