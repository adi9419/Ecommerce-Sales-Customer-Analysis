create database ecommmerce_project;
use ecommerce_project;
create table orders(
Order_ID VARCHAR(20),
Order_Date VARCHAR(10),
    Customer_ID VARCHAR(20),
    Customer_Name VARCHAR(100),
    City VARCHAR(100),
    State VARCHAR(100),
    Category VARCHAR(100),
    Product VARCHAR(100),
    Quantity INT,
    Unit_Price DECIMAL(10,2),
    Discount DECIMAL(5,2),
    Payment_Mode VARCHAR(50),
    Sales DECIMAL(12,2),
    Profit DECIMAL(12,2)
);
SHOW TABLES
USE ecommerce_project;

TRUNCATE TABLE orders;

SELECT COUNT(*) FROM orders;
TRUNCATE TABLE ecommerce_project.orders;
SELECT COUNT(*) FROM ecommerce_project.orders;
LOAD DATA LOCAL INFILE 'C:\Users\Aditya Kulkarni\Downloads\ecommerce_sales_cleaned.csv'
INTO TABLE ecommerce_project.orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(Order_ID, Order_Date, Customer_ID, Customer_Name, City, State,
 Category, Product, Quantity, Unit_Price, Discount, Payment_Mode, Sales, Profit);
 SHOW GLOBAL VARIABLES LIKE 'local_infile';
 SET GLOBAL local_infile = ON;
 LOAD DATA LOCAL INFILE 'C:\Users\Aditya Kulkarni\Downloads\ecommerce_sales_cleaned.csv'
INTO TABLE ecommerce_project.orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(Order_ID, Order_Date, Customer_ID, Customer_Name, City, State,
 Category, Product, Quantity, Unit_Price, Discount, Payment_Mode, Sales, Profit);
 SHOW WARNINGS;
 SHOW GLOBAL VARIABLES LIKE 'local_infile';
 TRUNCATE TABLE ecommerce_project.orders;
 LOAD DATA LOCAL INFILE 'C:\Users\Aditya Kulkarni\Downloads\ecommerce_sales_cleaned.csv'
INTO TABLE ecommerce_project.orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(Order_ID, Order_Date, Customer_ID, Customer_Name, City, State,
 Category, Product, Quantity, Unit_Price, Discount, Payment_Mode, Sales, Profit);
 SELECT LOAD_FILE('C:/Users/Aditya/Downloads/ecommerce_sales_cleaned.csv');
  LOAD DATA LOCAL INFILE 'C:\Users\Aditya Kulkarni\Downloads\ecommerce_sales_cleaned.csv'
INTO TABLE ecommerce_project.orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(Order_ID, Order_Date, Customer_ID, Customer_Name, City, State,
 Category, Product, Quantity, Unit_Price, Discount, Payment_Mode, Sales, Profit);
 TRUNCATE TABLE ecommerce_project.orders;
 LOAD DATA LOCAL INFILE 'C:/Users/Aditya Kulkarni/Downloads/ecommerce_sales_cleaned.csv'
INTO TABLE ecommerce_project.orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(Order_ID, Order_Date, Customer_ID, Customer_Name, City, State,
 Category, Product, Quantity, Unit_Price, Discount, Payment_Mode, Sales, Profit,
 @blank1, @blank2, @blank3);
 SELECT COUNT(*) FROM ecommerce_project.orders;
 SELECT * FROM ecommerce_project.orders
LIMIT 10;
SELECT COUNT(*) AS Total_Orders, SUM(Sales) AS Total_Sales, SUM(Profit) AS Total_Profit FROM ecommerce_project.orders;
SELECT Category, SUM(Sales) AS Total_Sales FROM ecommerce_project.orders group by Category order by Total_Sales DESC LIMIT 5;
SELECT Product, SUM(Sales) AS Total_Sales
FROM ecommerce_project.orders
GROUP BY Product
ORDER BY Total_Sales DESC
LIMIT 5;
SELECT Payment_Mode, COUNT(*) AS Orders, SUM(Sales) AS Total_Sales
FROM ecommerce_project.orders
GROUP BY Payment_Mode
ORDER BY Total_Sales DESC;
SELECT State, SUM(Sales) AS Total_Sales, SUM(Profit) AS Total_Profit
FROM ecommerce_project.orders
GROUP BY State
ORDER BY Total_Sales DESC;
SELECT City, SUM(Sales) AS Total_Sales, SUM(Profit) AS Total_Profit
FROM ecommerce_project.orders
GROUP BY City
ORDER BY Total_Sales DESC
LIMIT 10;
SELECT 
    LEFT(Order_Date, 7) AS Month,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM ecommerce_project.orders
GROUP BY LEFT(Order_Date, 7)
ORDER BY Month;SELECT 
    Customer_ID,
    Customer_Name,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM ecommerce_project.orders
GROUP BY Customer_ID, Customer_Name
ORDER BY Total_Sales DESC
LIMIT 10;
SELECT 
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin_Percent
FROM ecommerce_project.orders;
SELECT 
    Discount,
    COUNT(*) AS Orders,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM ecommerce_project.orders
GROUP BY Discount
ORDER BY Discount;
SELECT 
    Order_ID,
    Order_Date,
    Customer_ID,
    Customer_Name,
    City,
    State,
    Category,
    Product,
    Quantity,
    Unit_Price,
    Discount,
    Payment_Mode,
    Sales,
    Profit
FROM ecommerce_project.orders;
 
