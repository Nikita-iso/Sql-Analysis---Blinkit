Create Database Blinkit;
Use Blinkit;
Desc blinkit;

Select * from blinkit;

-- 1. List of Months with the total sales

Select Month, SUM(Sales) AS total_sales
From blinkit
Group by Month
Order by Month;

-- 2. which item has highest average sales

Select category, Avg(sales) AS avg_sales
From blinkit
Group by category
Order by avg_sales Desc
Limit 1;

-- 3. Listing the Item Fat Content Sales on each Month

Select Month, Item_Fat_Content, 
SUM(Sales) AS Total_Sales
From blinkit
Group by Month, Item_Fat_Content
Order by Month, Item_Fat_Content;

-- 4 Is there a correlation between Outlet Size and average Sales?

Select Outlet_Size, Avg(sales) AS avg_sales
From blinkit
Group by Outlet_Size;

-- 5. Listing Sales of Outlet Location Type for Each Month

Select Month, Outlet_Location_Type, SUM(Sales) AS Total_Sales
From blinkit
Group by Month, Outlet_Location_Type
Order by Outlet_Location_Type;

-- 6. Top-selling Item Type for each Outlet Type

Select Outlet_Type, Category, Max(Sales) AS max_sales
From blinkit
Group by outlet_type, Category;


Select Outlet_Type, Category, Sum(Sales) AS total_sales
From blinkit
Group by outlet_Type, Category;

-- 7. Relationship between Item Fat Content and Average Rating

Select Item_Fat_Content, Avg(Rating) AS Avg_Rating
From blinkit
Group by Item_Fat_Content
Order by Avg_Rating Desc;

-- 8. How does the average Rating differ across Outlet Location Types?
Select Outlet_Location_Type, Avg(Rating) AS avg_rating
From blinkit
Group by Outlet_Location_Type
Order by Avg_Rating Desc;

-- 9. What is the sales distribution across different Item Fat Content categories for each Outlet Size?
Select outlet_size, item_fat_content, 
Round(Sum(sales),2) AS total_sales
From blinkit
Group by outlet_size, item_fat_content
Order by outlet_size, item_fat_content;

-- 10. . Which Items have above-average Sales but below-average Ratings?
Select category, sales, rating
From blinkit
Where sales > (Select Avg(sales) From blinkit)
And rating < (Select Avg(rating) From blinkit);

-- 11. Total sales contributed by each Outlet Type

Select Outlet_Type, SUM(Sales) AS Total_Sales
From blinkit
Group by Outlet_Type
Order by Total_Sales Desc;

-- 12. Identify the top 5 Items Sales based on total Sales and average Rating

Select category, Sum(sales) AS total_sales, Avg(rating) AS avg_rating
From blinkit
Group by category
Order by Total_Sales Desc, Avg_Rating Desc
Limit 5;

-- 13. Sales performance of Low Fat items compared to Regular items across different Outlet Types

Select Outlet_Type, Item_Fat_Content, SUM(Sales) AS Total_Sales
From blinkit
Where Item_Fat_Content IN ('Low Fat', 'Regular')
Group by Outlet_Type, Item_Fat_Content
Order by Outlet_Type, Item_Fat_Content;

-- 14. What is the Sales for items with Ratings above 4.0?

Select Sum(sales) AS Total_Sales_above_4_rating
From blinkit
Where rating > 4.0;