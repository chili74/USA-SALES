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

SQL

- Date 
