--change in time


SELECT 
    YEAR(o.OrderDate_New)  AS Order_Year,
    MONTH(o.OrderDate_New) AS Order_Month,
    SUM(o.Sales_New)       AS Total_Sales,
    COUNT(DISTINCT c.Customer_ID) AS Total_Customers,
    SUM(o.Quantity_new)        AS Total_Quantity
FROM Orders o
LEFT JOIN Customers c
    ON c.Customer_ID = o.CustomerID
WHERE o.OrderDate_New IS NOT NULL
GROUP BY YEAR(o.OrderDate_New), MONTH(o.OrderDate_New)
ORDER BY Order_Year, Order_Month;