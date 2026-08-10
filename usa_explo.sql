--Date Explorations 

/*(1)Query provided the min(orderdate) as the last and the max(orderdate) as the first because of an (2) incorrect data type(nvarchar) 
for the orderdate column. Tried converted the orderdate column to a date data type, did not work. So i add a new column orderdate_new with 
a date data type.The following queries will now provide the correct min and max order dates.*/

--(1)
Select 
min(orderdate) as first_orderdate,
max(orderdate) as last_orderdate
from Orders

--(2)
SELECT 
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Orders'
AND COLUMN_NAME = 'OrderDate';

SELECT OrderDate
FROM Orders
WHERE TRY_CONVERT(DATE, OrderDate, 103) IS NULL
  AND OrderDate IS NOT NULL;

ALTER TABLE Orders
ALTER COLUMN OrderDate DATE;

ALTER TABLE Orders
ADD OrderDate_New DATE;

UPDATE Orders
SET OrderDate_New = TRY_CONVERT(DATE, OrderDate, 103);

SELECT OrderDate, OrderDate_New
FROM Orders;

SELECT 
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Orders'
AND COLUMN_NAME = 'shipdate';

--Finds the date of the first and last orderdates and the how many years of orderdates are there in the data set
Select 
min(orderdate_new)as first_orderdate,
max(orderdate_new)as last_orderdate, 
datediff(year, min(orderdate_new), max(orderdate_new)) as order_years
from Orders

--shipdate column is also nvarchar, so we will convert it to date data type and add a new column shipdate_new with date data type
SELECT ShipDate
FROM Orders
WHERE TRY_CONVERT(DATE, ShipDate, 103) IS NULL
  AND ShipDate IS NOT NULL;

ALTER TABLE Orders
ALTER COLUMN shipDate DATE;

ALTER TABLE Orders
ADD ShipDate_New DATE;

UPDATE Orders
SET ShipDate_New = TRY_CONVERT(DATE, OrderDate, 103);


--Finds the date of the first and last order shipped orders and the how many years of shipped orders are there in the data set
Select 
min(shipdate_new)as first_orderdate,
max(shipdate_new)as last_orderdate, 
datediff(year, min(shipdate_new), max(shipdate_new)) as order_years
from Orders