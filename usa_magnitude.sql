--Magnitude 

select 
sum(o.sales_new),l.state
from orders o
inner join location l on o.postalcode = l.postal_code
group by l.state

select count(Product_name), category from products
group by category

select avg(o.sales_new), p.sub_category from orders o
join products p on o.productid = p.product_id
group by p.sub_category

select sum(o.sales_new),p.category from orders o
join products p on o.productid = p.product_id
group by p.category


select sum(o.sales_new) as Customer_revenue, c.customer_name from orders o
join customers c on o.customerid = c.customer_id
group by c.customer_name
order by sum(o.sales_new) desc

select 
l.state, sum(o.quantity_new) as sold_items 
from orders o 
left join location l on o.postalcode = l.postal_code
group by l.state

