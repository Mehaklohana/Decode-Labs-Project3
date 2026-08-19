create database orders;
use orders;
CREATE TABLE orders (
    OrderID VARCHAR(20) PRIMARY KEY,
    Date DATE,
    CustomerID VARCHAR(20),
    Product VARCHAR(50),
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    Shipping_Address VARCHAR(255),
    Payment_Method VARCHAR(50),
    Order_Status VARCHAR(50),
    Tracking_Number VARCHAR(50),
    ItemsIn_Cart INT,
    Coupon_Code VARCHAR(50),
    Referral_Source VARCHAR(50),
    Total_Price DECIMAL(10,2)
);

SELECT 
    COUNT(OrderID) AS Total_Orders,
    SUM(Total_Price) AS Total_Revenue,
    AVG(Total_Price) AS Average_Order_Value
FROM orders;

SELECT 
    Product,
    COUNT(OrderID) AS Total_Orders,
    SUM(Quantity) AS Total_Quantity_Sold,
    SUM(Total_Price) AS Total_Revenue,
    AVG(Total_Price) AS Avg_Order_Value
FROM orders
GROUP BY Product
ORDER BY Total_Revenue DESC;

SELECT 
    Order_Status,
    COUNT(OrderID) AS Order_Count,
    ROUND((COUNT(OrderID) * 100.0 / (SELECT COUNT(*) FROM orders)), 2) AS Percentage,
    SUM(Total_Price) AS Status_Revenue
FROM orders
GROUP BY Order_Status
ORDER BY Order_Count DESC;

SELECT 
    OrderID,
    Date,
    CustomerID,
    Product,
    Quantity,
    UnitPrice,
    Total_Price
FROM orders
WHERE Total_Price > 3000.00
ORDER BY Total_Price DESC;

