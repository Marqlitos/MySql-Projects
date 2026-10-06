-- crear tablas a partir de otras tablas
-- world, nwind (northwind), sakila

use world;
select * from country;

create table paises_Europa as
select code, name, surfacearea, population, lifeexpectancy
from country
where continent = 'Europe' and lifeexpectancy >= 70
order by lifeexpectancy desc;

select * from paises_europa;

describe paises_europa;
describe country;