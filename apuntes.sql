/* Crear Base de datos 
Create database tallerbd_B;
*/

/*
Use information_schema;
show tables;
select * from schemata;

*/

/*
select default_character_set_name, default_collation_name
from schemata 
where schema_name = 'northwind';
*/

/*
show create table northwind.products;
*/

/*
describe columns;

*/

select column_name, character_set_name, 
collation_name 
from columns
where table_name = 'country'
and table_schema = 'world';

show variables like '%collat%';