--Measure Explorations 

select * from products
--Total sales 
select sum(sales_new) as total_sales from orders

--Total quantity
select sum(quantity_new) as total_quantity from orders

--Average sales amount
select avg(sales_new) avg_sales_amount from orders

--total orders, products, and customers
select count(orderid) as total_orders from orders
union all
select count(product_id) as total_products from products
union all
select count(distinct customer_id) as total_customers from customers


ALTER TABLE Orders
add Sales_New decimal(10,2);

UPDATE Orders
SET Sales_New = TRY_CONVERT(decimal(10,2), Sales, 103);

ALTER TABLE Orders
add Quantity_New int;

UPDATE Orders
SET Quantity_New = TRY_CONVERT(int, Quantity, 103);