-- uri (2602)
select customers.name from customers where state = 'RS';

-- (2603)
select name,street from customers where city like 'Porto Alegre';

-- (2604)
select products.id, products.name from products where products.price < 10 or products.price > 100;

-- (2605)
select products.name, providers.name from products, providers where products.id_categories = 6 and products.id_providers = providers.id;

-- (2606)
SELECT products.id, products.name FROM products JOIN categories ON products.id_categories = categories.id WHERE categories.name like 'super%';

-- (2607)
select DISTINCT city from providers; 

-- (2608)
select max(price) as price, min (price) as price from products;

-- (2609)
select categories.name, sum(products.amount) from products, categories where products.id_categories = categories.id group by categories.name;

-- (2611)
select movies.id, movies.name from movies as id_genres where genres = 3;