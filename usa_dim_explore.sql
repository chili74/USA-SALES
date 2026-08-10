--Dimensions Exploration 

select * from Location
select * from Orders
select * from Products
Select * from Customers

--Exploring all Cities 
select distinct(city) from Location
--EXploring all States
select distinct(state) from Location
--Exploring all Regions
select distinct(region) from Location

--Exploring all Segments
select distinct(segment)from Orders

--Exploring all categories and sub-categories
select distinct(category) from Products
select distinct(sub_category) from Products