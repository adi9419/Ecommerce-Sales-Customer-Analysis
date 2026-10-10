USE ecommerce_project;

-- 1. Overall Sales and Profit
SELECT
    COUNT(*) AS Total_Orders,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM orders;

-- 2. Sales by Category
SELECT
    Category,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM orders
GROUP BY Category
ORDER BY Total_Sales DESC;

-- 3. Top 5 Products
SELECT
    Product,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM orders
GROUP BY Product
ORDER BY Total_Sales DESC
LIMIT 5;

-- 4. Payment Mode Analysis
SELECT
    Payment_Mode,
    COUNT(*) AS Total_Orders,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM orders
GROUP BY Payment_Mode
ORDER BY Total_Orders DESC;

-- 5. Sales by State
SELECT
    State,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM orders
GROUP BY State
ORDER BY Total_Sales DESC;

-- 6. Top 10 Cities
SELECT
    City,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM orders
GROUP BY City
ORDER BY Total_Sales DESC
LIMIT 10;

-- 7. Top 10 Customers
SELECT
    Customer_ID,
    Customer_Name,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM orders
GROUP BY Customer_ID, Customer_Name
ORDER BY Total_Sales DESC
LIMIT 10;
-- 8. Profit Margin
SELECT
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(
        100.0 * SUM(Profit) / NULLIF(SUM(Sales), 0), 2
    ) AS Profit_Margin_Percent
FROM orders;

-- 9. Discount vs Profit
SELECT
    Discount,
    COUNT(*) AS Total_Orders,
    ROUND(AVG(Profit), 2) AS Average_Profit,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM orders
GROUP BY Discount
ORDER BY Discount;

-- 10. Monthly Sales and Profit
SELECT
    DATE_FORMAT(
        STR_TO_DATE(Order_Date, '%d-%m-%Y'),
        '%Y-%m'
    ) AS Month,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM orders
GROUP BY Month
ORDER BY Month;