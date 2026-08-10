--Part to whole 


with sales_per_category as (
select 
 p.category, 
 sum(o.sales_new) as total_sales
 from orders o
 left join products p on o.productid = p.product_id
 group by p.category)

 select 
 category,
 total_sales,
 sum(total_sales) over() overall_sales,
 concat(round((cast(total_sales as float) / sum(total_sales) over())*100, 2), '%') as percentage_of_total
 from sales_per_category 


