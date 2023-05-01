-- temas para el examen 
-- consultas de varias tabalas
-- Sub consultas Correlacionadas 
-- Agrupaciones (Group by)
-- procedimientos almacenados 
-- vistas 
-- --------------------------------------------------------------------------------------------------------------------------------------------------------------

-- consultas de varias tabalas
-- mostrar la clave del producto, nombre del producto,
-- precio unitario, nombre del proveedor y nombre de la categoria.

use nwind;
Select p.productId, p.productName, p.unitPrice,
s.companyName, c.categoryName, c.categoryName 
From products p Join categories c On p.CategoryId = c.categoryId
Join Suppliers s On s.supplierId = p.productId;


-- Sub consultas Correlacionadas 
-- clave Cliente , Nombre, Pais, Ordenes 96, Ordenes 97, Ordenes 98

select c.customerId, c.CompanyName, c.Country,
(
Select count(*) From Orders o Where o.CustomerId = c.customerID
And Year (o.OrderDate) = 1996
) as Ordenes96,
(
Select count(*) From Orders o Where o.CustomerId = c.customerID
And Year (o.OrderDate) = 1997
) as Ordenes97,
(
Select count(*) From Orders o Where o.CustomerId = c.customerID
And Year (o.OrderDate) = 1998
) as Ordenes98
from customers c;

-- Agrupaciones (Group by)
-- procedimientos almacenados 
-- vistas 