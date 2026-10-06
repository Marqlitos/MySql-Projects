
create database mipractica1
character set utf8mb4
collate utf8mb4_unicode_ci;

use mipractica1;

create table if not exists categories(
CategoryID int primary key,
CategoryName varchar (15) not null,
Descriptions longtext null,
Picture longblob null
);

create table if not exists Customers(
CustomerID char (5) primary key,
CompanyName varchar (40) not null,
ContactName varchar (30) null,
ContactTitle varchar (30) null,
Address varchar (60) null,
City varchar (15) null,
Country varchar (15) null,
Phone varchar (24) null
);

create table if not exists products(
ProductID int primary key,
ProductName varchar (40) not null,
CategoryID int null,
Quantity Varchar (20) null,
UnitPrice decimal (19,4) null,
UnitsStock smallint null,
Discontinued tinyint null,

constraint fk_prod_cat foreign key (categoryID) references categories(CategoryID)
on update cascade
on delete restrict,

constraint chk_unitprice_positive check (UnitPrice >= 0)

);

create table if not exists Orders(
OrderID int auto_increment primary key,
CustomerID char(5) null,
RequiredDate datetime,
ShippingDate datetime,
Freight decimal(19,4),
ShipName varchar(40),
ShipAddress varchar(60),
ShipCountry varchar(15),

constraint fk_ord_cust 
foreign key (CustomerID) 
references customers(CustomerID)
);

create table`order details` (
    OrderID int,
    ProductID int,
    UnitPrice decimal(10,4) not null,
    Quantity smallint not null,
    Discount float not null,
    
primary key (OrderID, ProductID),
constraint fk_det_ord foreign key (OrderID) references orders(OrderID),
constraint fk_det_prod foreign key (ProductID) references products(ProductID)
);

-- Parte 3 --
alter table customers modify column Country varchar (20);
alter table products add column PrecioCompra decimal (19,4) after UnitPrice;
alter table customers change column phone TELEFONO varchar (20);
alter table products drop column Discontinued;


-- Parte 4 --

insert into categories (CategoryID, CategoryName, Descriptions)
values (1, 'Componentes PC', 'Piezas y accesorios de computadora');


insert into products (ProductID, ProductName, CategoryID, Quantity, UnitPrice, PrecioCompra, UnitsStock)
values 
(1, 'Mause Gamer', 1, '1 pieza', 980, 500, 9),
(2, 'Teclado Gamer', 1, '1 pieza', 1200, 890, 12),
(3, 'Disco duro SSD', 1, '1 pieza', 750, 350, 30),
(4, 'Disco duro HDD', 1, '1 pieza', 1100, 600, 22),
(5, 'Monitor', 1, '1 pieza', 2980, 200, 3),
(6, 'HDMI 3 Metros', 1, '1 pieza', 230, 100, 8),
(7, 'Mantenimiento general a PC',1, '1 pieza', 1500, 1500, 10),
(8, 'Memoria USB 64 GB', 1, '1 pieza', 120, 100, 9),
(9, 'Micro SD 256 GB', 1, '1 pieza', 980, 800, 5),
(10, 'Baterias AA', 1, '1 pieza', 30, 20, 50);


insert into customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Country, TELEFONO)
values
	('C0001', 'Tienda tecnologica Zadani', 'Juan Pérez', 'Dueño', 'Calle Hidalgo 45', 'Moroleón', 'México', '445-123-4567'),
    ('ITSUR', 'Instituto Tecnológico', 'María García', 'Directora', 'Av. Universidad 1', 'Moroleón', 'México', '445-987-6543'),
    ('C0003', 'Tecnologicos Marce', 'Carlos Gómez', 'Gerente', 'Madero 123', 'Uriangato', 'México', '445-555-9999'),
    ('C0004', 'Papelería La Goma', 'Ana López', 'Vendedora', 'Portal Matamoros', 'Moroleón', 'México', '445-111-2222'),
    ('C0005', 'Tech Solutions', 'Luis Martínez', 'Soporte', 'Plaza Principal', 'Yuriria', 'México', '445-444-5555');

insert into orders (CustomerID, RequiredDate, ShippingDate, Freight, ShipName, ShipAddress, ShipCountry)
values
('ITSUR', '2026-08-12 14:00:00', '2026-08-20 08:00:00',  50.00, 'Instituto Tecnológico', 'Av. Universidad 1', 'México'),
('C0003', '2026-08-13 16:45:00', '2026-08-18 10:00:00',  200.00, 'Tech Solutions', 'Madero 123', 'México');
