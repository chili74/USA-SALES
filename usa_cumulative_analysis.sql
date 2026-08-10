-- Cumulative analysis


SELECT
    order_date,
    total_sales,
    SUM(total_sales) OVER (ordetr_date) AS running_total_sales,
    avg(avg_price) over (order by order_date) as moving_average_price
FROM
(
    SELECT 
        DATETRUNC(month, OrderDate_New) AS order_date,
        SUM(Sales_New) AS total_sales,
        avg(sales_new) as avg_price 
    FROM orders
    WHERE OrderDate_New IS NOT NULL
    GROUP BY DATETRUNC(month, OrderDate_New)
) t
ORDER BY order_date;