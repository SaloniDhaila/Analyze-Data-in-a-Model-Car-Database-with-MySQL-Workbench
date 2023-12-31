-- Analyze Data in a Model Car Database with MySQL Workbench


-- Total inventory in all the warehouses -

SELECT
warehousecode,
SUM(quantityInStock) AS total_inventory
FROM 
mintclassics.products
GROUP BY
warehouseCode
ORDER BY 
total_inventory DESC;

-- Warehouse D has the least inventory.



-- Less ordered or inactive products

SELECT 
OD.productCode,
P.productName,
P.warehouseCode,
OD.quantityOrdered,
P.quantityInStock
FROM
mintclassics.orderdetails AS OD
JOIN 
products AS P 
ON
OD.productCode = P.productCode
ORDER BY
quantityOrdered;

-- Inventory of the product with less sales needs to be eliminated.



--  pricing of each product with total ordered

SELECT
p.productCode,
p.productName,
p.buyprice,
SUM(od.quantityordered) AS TotalOrders
FROM
mintclassics.products as p
LEFT JOIN
orderdetails AS od
ON
p.productcode = od.productcode
GROUP BY
p.productcode,
p.productName,
p.buyPrice
ORDER BY
p.buyPrice DESC;

-- Adjusting the prices of specific products with low sales will help to clear the inventory more 



-- finding out which customer have more purchases 

SELECT
p.customerNumber,
cu.customerName,
CU.creditLimit,
p.amount AS payments_made
FROM
mintclassics.customers AS cu
JOIN
payments AS p
ON
cu.customerNumber = p.customerNumber
ORDER BY
payments_made DESC;

-- Customers with high purchase amount and with high credit limit should be Considered more and should be provided with incentives so that they can purchase more .






