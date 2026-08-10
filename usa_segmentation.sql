--segmentation 

with customer_spending as(
select 
c.Customer_ID, 
sum(sales_new) as total_spending,
min(o.OrderDate_New) as first_order_date,
max(o.OrderDate_New) as last_order_date,
datediff(month, min(o.OrderDate_New), max(o.OrderDate_New)) as active_months
from .Customers c
left join .Orders o on c.Customer_ID = o.CustomerID
group by c.Customer_ID
)

select 
customer_segment,
count(c.customer_id) as total_customers
from (
    select 
    customer_id,
case when active_months > 12 and total_spending > 5000 then 'VIP' 
     when active_months >= 12 and total_spending <= 5000 then 'Regular' 
     else 'New' 
end as customer_segment
from customer_spending)
group by customer_segment
order by total_customer desc
 
