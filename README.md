This project explores,cleans, and analyses usa retail sales data for a company call ()
using SQL Server and SSMS, then visualises the results in an interactive Tableau dashboard. It follows a structured exploratory data analysis(EDA) and Advanced Analysis framework to turn raw, inconsistently retional data into bussiness-ready insights on sales performance, customer value,and regional trends. 

## Raw Material 
- Orders
- Products
- Customers
- Locations

## Objetives 
- Inspect database structures and metadata.
- Identify and correct data type issues in raw sources columns
- Explore categorical dimensions and numerical measures
- Determine dataset time coverage
- Calculate core business metrics and KPIs
- Reveal trends, patterns, and top/bottom performers
- segment customerrs by value and activity

## Technologies 
- SQL Server
- SQL Server Management Studies (SSMS) 
- Tableau

## Data Quality & Cleaning

  Several sauce columns were stored into an incorrect data type which distorted early results(e.g MIN(orderdate) returning a later date then MAX(OrderDate) due to orderdate being stored as nvarchar).

 Corrections made:
  - Added OrderDAte_New(DATE) and ShipDate_New(DATE), convented from the original nvarchar columns using TRY CONVERT.
  - Added Sales_New (DECIMAL(10,2)) and Quantity_New(INT), converted from their original text-typed columns.
  - Verified column data types via INFORMATION_SCHEMA.COLUMNS before and after conversion.
  - Re-ran data-range checks against the corrected columns to confirm accurate first/last order and ship dates and total years of coverage

  - All downstream queries reference the corrected _New columns rather then the raw source columns.

## Project Structure 

SQL/ 
- Datebase Exploration.sql
- Dimension Exploration.sql
- Date Exploration.sql
- Measures Exploration.sql
- Magnitude Analysis.sql
- Ranking Analysis.sql
- Change Over Time Analysis.sql
- Cumulative Analysis.sql
- Performance Analysis.sql
- Part-to-whole Analysis.sql
- Segmentation Analysis.sql
- README.md
  Dashboard/
- USA_Sales_Dashboard.twbx
  

## Exploratory Data Analysis Framework 

1. Database Exploration - Map tables,columns, and data types via INFORMATION_SCHEMA.
   Locates correct sources for reporting and reduces errors.

2. Dimension Exploration - Explore categorical fields: City, States, Region, Segment,     Category , Sub-Category. Identifies reporting categoreies and businesss scope.

3. Date Exploration - Diagnose and fix OrderDate?ShipDate type issues; establish          accurate dataset time span for trend analysis.

4. Measures Exploration - Summarize cores numerical metrics: total sales, total quantity, average sale account, total orders/products/customers.

5. Magnitude Analysis - Compare performance across dimensions: revenue by states,
   item count by category, average sales by sub-category, revenue by customer.

6. Ranking Analysis - Identity top and bottom 10 performers by products, state, and       customers revenue.

## Advanced Analysis 

7. Change Over Time - Monthly sales, customer count, and quantity trends over the full    order history.

8. Cumulative Analysis - Running total of monthly sales and moving average sale price     to track growth momentum.

9. Performance Analysis - Year-over-year product performance;eash product's sales vs      its yearly average, and vs, its prior-yearly sales, flagged as Above/Below/Average     and Increased and Decreased

10. Part-to-Whole Analysis - percentage revenue contribution of each product category
    to total sales.

11. Data Segmentation - Customers segmented into  VIP, Regular, and New tiers based        on total spend and months active, then counted per segment




   


