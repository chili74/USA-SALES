--Ranking

select top 10 p.product_name, sum(o.sales_new) as total_sales
from orders o
join products p on o.productid = p.product_id
group by p.product_name
order by total_sales desc

select top 10 p.product_name, sum(o.sales_new) as total_sales
from orders o
join products p on o.productid = p.product_id
group by p.product_name
order by total_sales 

select top 10 l.state, sum(o.sales_new) as total_sales 
from orders o
join location l on o.postalcode = l.postal_code
group by l.state
order by total_sales desc

select top 10 l.state, sum(o.sales_new) as total_sales 
from orders o
join location l on o.postalcode = l.postal_code
group by l.state
order by total_sales 

select top 10 sum(o.sales_new) as Customer_revenue, c.customer_name from orders o
join customers c on o.customerid = c.customer_id
group by c.customer_name
order by sum(o.sales_new) desc

select top 10 sum(o.sales_new) as Customer_revenue, c.customer_name from orders o
join customers c on o.customerid = c.customer_id
group by c.customer_name
order by sum(o.sales_new) 