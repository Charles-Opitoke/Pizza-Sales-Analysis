
# Pizza Sales Analysis




### Excel Workbook Link : https://1drv.ms/x/s!Aiv8oXx0O2W39CqUq0RpJk9DgDSV

## Problem Statement

### KPI’S REQUIREMENT
Wanted to analyse key indicator for our Pizza Sales data to gain insights into our business performance. Specially, we want to calculate the following matric:

- Total Revenue: This is the sum of the total price of all Pizza Ordered.
- Average Order Value: This is the average amount spent per order, calculated by dividing the total revenue by the total number of orders.
- Total Pizza Sold: This is the sum of the quantities of all Pizzas sold.
- Total Order: This is the total number of orders placed.
- Average Pizzas Per Order: This is the average number of Pizzas sold per order, calculated by dividing the total number of Pizzas sold by total number of orders.

### CHARTS REQUIREMENT
We will like to visualise various aspects of our Pizza Sales Data to gain insights and understand key trends. We have identified the following requirements for creating charts:

- Daily Trend for Total Orders: Create a bar chart that displays the daily trend of total orders over a specific time period. This chart will help us identify any patterns or fluctuations in order volumes on a daily basis.
- Hourly Trend for Total Orders: Create a line chart that illustrate the hourly trend of total orders throughout the day. This chart will allow us to identify peak hours or periods of high order activity.
- Percentage of Sales by Pizza Category: Create a pie chart that shows the distribution of sales across different Pizza categories. This chart will provide insights into the popularity of various Pizza categories and their contribution to overall sales.
- Percentage of Sales by Pizza Size: Generate a Pie chart that represent the percentage of sales attributed to different pizza sizes. This chart will help understand customer preferences for Pizza sizes and their impact on sales.
- Total Pizzas Sold by Pizza Categories: Create a funnel chart that present the total number of Pizzas sold for each Pizza category. This chart will allow us to compare the sales performance of different Pizza categories.
- Top 5 Best Selling Pizzas based on the Total number of Pizzas Sold: Create a bar chart highlighting the top 5 bestselling Pizzas based on the total number of Pizzas sold. This chart will help us identify the most popular Pizza options. 
- Bottom 5 Worse Selling by Total Pizzas Sold: Create a Bar chart showcasing the bottom 5 worse selling Pizzas based n the total number of Pizzas sold. This chart will enable us to identify under perfuming or less popular Pizza options.

![P18](https://github.com/Charles-Opitoke/Bank-Loan-Analysis-/assets/164562500/02d589ee-f267-4ef4-8520-c7893b6ef2f2)

## SQL Analysis

Step 1: Import Dataset into SQL Server

    select * from pizza_sales_1
![P1](https://github.com/Charles-Opitoke/Bank-Loan-Analysis-/assets/164562500/84ae7690-75b9-4fd9-b78d-0d9bf4c1d485)

Step 2: Total Revenue

    SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales
![P2](https://github.com/Charles-Opitoke/Bank-Loan-Analysis-/assets/164562500/bbbfed9f-0bcd-4449-a773-7c8f039d0d30)

Step 3: Average Order Value
    SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza_sales

![P3](https://github.com/Charles-Opitoke/Bank-Loan-Analysis-/assets/164562500/050c13b5-a1c5-49bf-b26c-48e0edb8ee52)

Step 4: Total Pizzas Sold
    SELECT SUM(quantity) AS Total_pizza_sold FROM pizza_sales

![P4](https://github.com/Charles-Opitoke/Bank-Loan-Analysis-/assets/164562500/ddb78fa4-9c01-43c2-bf7f-f16e9f569ceb)

Step 5: Total Orders
    SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales

![P5](https://github.com/Charles-Opitoke/Bank-Loan-Analysis-/assets/164562500/be287a99-1011-46a0-9060-111b4573e9ff)

Step 6: Average Pizzas Per Order

    SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
    CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
    AS Avg_Pizzas_per_order
    FROM pizza_sales

![P6](https://github.com/Charles-Opitoke/Bank-Loan-Analysis-/assets/164562500/bfa7f792-084b-4df9-8d20-b849dcdb4eaa)

Step 7: Daily Trend for Total Orders

    SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
    FROM pizza_sales
    GROUP BY DATENAME(DW, order_date)

![P7](https://github.com/Charles-Opitoke/Bank-Loan-Analysis-/assets/164562500/dec41cfe-e9e6-4d72-bdfe-a01efd8b8e47)

Step 8: Monthly Trend for Orders

    select DATENAME(MONTH, order_date) as Month_Name, COUNT(DISTINCT order_id) as Total_Orders
    from pizza_sales
    GROUP BY DATENAME(MONTH, order_date)Output

![P8](https://github.com/Charles-Opitoke/Bank-Loan-Analysis-/assets/164562500/13e7ef30-f01c-4df2-b41c-77033562ea01)

Step 9: % of Sales by Pizza Category

    SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
    CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
    FROM pizza_sales
    GROUP BY pizza_category

![P9](https://github.com/Charles-Opitoke/Bank-Loan-Analysis-/assets/164562500/a1390e4e-c772-4e3e-bb2b-fd8efee22319)

Step 10: % of Sales by Pizza Size

    SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
    CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
    FROM pizza_sales
    GROUP BY pizza_size
    ORDER BY pizza_size

![P11](https://github.com/Charles-Opitoke/Bank-Loan-Analysis-/assets/164562500/c62cbe37-4c75-43ff-bdcb-5e675f4f0162)

Step 11: Total Pizzas Sold by Pizza Category

    SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
    FROM pizza_sales
    WHERE MONTH(order_date) = 2
    GROUP BY pizza_category
    ORDER BY Total_Quantity_Sold DESC

![P13](https://github.com/Charles-Opitoke/Bank-Loan-Analysis-/assets/164562500/57c5351c-f140-49e4-9bc3-53267aa2aad1)

Step 12: Top 5 Pizzas by Revenue

    SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
    FROM pizza_sales
    GROUP BY pizza_name
    ORDER BY Total_Revenue DESC

![P27](https://github.com/Charles-Opitoke/Bank-Loan-Analysis-/assets/164562500/beeccca3-3254-4d83-840e-17ab56e4dc5b)

Step 13: Bottom 5 Pizzas by Revenue

    SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
    FROM pizza_sales
    GROUP BY pizza_name
    ORDER BY Total_Revenue ASC

![P28](https://github.com/Charles-Opitoke/Bank-Loan-Analysis-/assets/164562500/c8534bbc-3033-463f-bca7-42331d55162c)

Step 14: Top 5 Pizzas by Quantity

    SELECT Top 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
    FROM pizza_sales
    GROUP BY pizza_name
    ORDER BY Total_Pizza_Sold DESC

![P14](https://github.com/Charles-Opitoke/Bank-Loan-Analysis-/assets/164562500/d882a18a-1eac-4506-91d7-0f68eb6f0354)

Step 15: Bottom 5 Pizzas by Quantity

    SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
    FROM pizza_sales
    GROUP BY pizza_name
    ORDER BY Total_Pizza_Sold ASC

![P15](https://github.com/Charles-Opitoke/Bank-Loan-Analysis-/assets/164562500/f80f8f55-f069-4c90-80d2-c23dc32a2a5d)

Step 16: Top 5 Pizzas by Total Orders

    SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
    FROM pizza_sales
    GROUP BY pizza_name
    ORDER BY Total_Orders DESC

![P29](https://github.com/Charles-Opitoke/Bank-Loan-Analysis-/assets/164562500/5d3bb0ab-35e3-49c0-ab4f-cccea9558da1)

Step 17: Borrom 5 Pizzas by Total Orders

    SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
    FROM pizza_sales
    GROUP BY pizza_name
    ORDER BY Total_Orders ASC

![P30](https://github.com/Charles-Opitoke/Bank-Loan-Analysis-/assets/164562500/09822519-abc5-4811-89f0-4494d821056a)

### NOTE
If you want to apply the pizza_category or pizza_size filters to the above queries you can use

      WHERE clause. Follow some of the below examples
    SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
    FROM pizza_sales
    WHERE pizza_category = 'Classic'
    GROUP BY pizza_name
    ORDER BY Total_Orders ASC


## Excel Visualization

![P19](https://github.com/Charles-Opitoke/Bank-Loan-Analysis-/assets/164562500/d24bd687-69ae-4c11-b83d-9ef89a529d84)

![P20](https://github.com/Charles-Opitoke/Bank-Loan-Analysis-/assets/164562500/f525811f-ab49-4fa6-a6f7-b5051f20561f)

![P21](https://github.com/Charles-Opitoke/Bank-Loan-Analysis-/assets/164562500/a383822a-b8f9-4f80-8aad-8ebb1e346f2b)

![P22](https://github.com/Charles-Opitoke/Bank-Loan-Analysis-/assets/164562500/9552e34d-2680-433a-a138-40dff1c03bdd)

![P23](https://github.com/Charles-Opitoke/Bank-Loan-Analysis-/assets/164562500/285103f2-baee-42e4-a598-7022a5495672)

![P24](https://github.com/Charles-Opitoke/Bank-Loan-Analysis-/assets/164562500/e0eef8c5-3154-4985-a66e-b52b8480dfd4)

![P25](https://github.com/Charles-Opitoke/Bank-Loan-Analysis-/assets/164562500/32767d34-7b71-4ae9-8365-86a77802418a)

![P26](https://github.com/Charles-Opitoke/Bank-Loan-Analysis-/assets/164562500/10194f1a-b487-4b5f-be24-ffca8db791b5)


## Observation

- Orders are highest on Sunday and Monday evenings at about 4pm to 8pm
- Classic large size pizza contributed to the maximum sales and orders  
- The Brie Carre pizza is the worse performing pizza both in sales and revenue



