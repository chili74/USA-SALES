-- Performance analysis 


with yearly_product_sales as (
select 
year(o.orderdate_new)as order_year,
p.product_name,
sum(o.sales_new) as current_sales
from orders o 
left join products p 
on o.productid = p.product_id
group by year(o.orderdate_new), p.product_name
)

select order_year,
product_name,
current_sales,
avg(current_sales) over(partition by order_year) as avg_sales,
current_sales - avg(current_sales) over(partition by order_year) as diff_avg,
case when current_sales - avg (current_sales) over(partition by product_name) > 0 then 'Above Average' 
     when current_sales - avg (current_sales) over (partition by product_name) < 0 then 'Below Average' 
     else 'avg' 
end avg_change,
lag(current_sales) over(partition by product_name order by order_year) as py_sales,
current_sales - lag(current_sales) over(partition by product_name order by order_year) as py_sales_diff,
case when current_sales - lag(current_sales) over(partition by product_name order by order_year) > 0 then 'Increased' 
     when current_sales - lag(current_sales) over (partition by product_name order by order_year) < 0 then 'Decreased' 
     else 'No Change' 
end py_change
from yearly_product_sales 
order by product_name, order_year 
