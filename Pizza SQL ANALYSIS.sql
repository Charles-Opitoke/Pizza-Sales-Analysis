select * from pizza_sales_1

SELECT SUM(total_price) AS Total_Revenue from pizza_sales_1

SELECT SUM(total_price) / COUNT(DISTINCT order_id) as Avg_Order_Value from pizza_sales_1

SELECT SUM(quantity) AS Total_Pizza_Sold from pizza_sales_1

SELECT COUNT(DISTINCT order_id) AS Total_Orders from pizza_sales_1

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Avg_Pizzas_Per_Order from pizza_sales_1

--Daily Trend
SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS Total_Orders from pizza_sales_1
GROUP BY DATENAME(DW, order_date)

--Hourly Trend
SELECT DATEPART(HOUR, order_time) AS Order_Hours, COUNT(DISTINCT order_id) from pizza_sales_1
GROUP BY DATEPART(HOUR, order_time)
ORDER BY DATEPART(HOUR, order_time)

SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales_1) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales_1
GROUP BY pizza_category

SELECT pizza_category, SUM(total_price) AS Total_Sales, SUM(total_price) * 100 / 
(SELECT SUM(total_price) from pizza_sales_1 WHERE MONTH(order_date) = 1) AS PCT
from pizza_sales_1
WHERE MONTH(order_date) = 1
GROUP BY pizza_category

SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Sales, CAST(SUM(total_price) * 100 / 
(SELECT SUM(total_price) from pizza_sales_1) AS DECIMAL(10,2)) AS PCT
from pizza_sales_1
GROUP BY pizza_size
ORDER BY PCT DESC

SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Sales, CAST(SUM(total_price) * 100 / 
(SELECT SUM(total_price) from pizza_sales_1 WHERE DATEPART(quarter, order_date)=1) AS DECIMAL(10,2)) AS PCT
from pizza_sales_1
WHERE DATEPART(quarter, order_date)=1
GROUP BY pizza_size
ORDER BY PCT DESC

SELECT pizza_category, SUM(quantity) AS Total_Pizza_Sold
from pizza_sales_1
GROUP BY pizza_category

SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizzas_Sold
FROM pizza_sales_1
GROUP BY pizza_name
ORDER BY SUM(quantity) DESC

SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizzas_Sold
FROM pizza_sales_1
GROUP BY pizza_name
ORDER BY SUM(quantity) ASC

SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizzas_Sold
FROM pizza_sales_1
WHERE MONTH(order_date)=1
GROUP BY pizza_name
ORDER BY SUM(quantity) ASC

SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizzas_Sold
FROM pizza_sales_1
WHERE MONTH(order_date)=8
GROUP BY pizza_name
ORDER BY SUM(quantity) ASC