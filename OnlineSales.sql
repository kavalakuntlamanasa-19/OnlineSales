1. Total Sales by country

SELECT Country, 
       SUM(Quantity * UnitPrice * (1 - Discount)) AS TotalSales
FROM online_sales_dataset
GROUP BY Country
ORDER BY TotalSales DESC


2. Number of Orders per Sales Channel

SELECT SalesChannel, COUNT(DISTINCT InvoiceNo) AS NumberOfOrders
FROM online_sales_dataset
GROUP BY SalesChannel

3. Return Rate by Product Category

SELECT Category,
       COUNT(*) AS TotalOrders,
       SUM(CASE WHEN ReturnStatus = 'Returned' THEN 1 ELSE 0 END) AS ReturnedOrders,
       ROUND(100.0 * SUM(CASE WHEN ReturnStatus = 'Returned' THEN 1 ELSE 0 END) / COUNT(*), 2) AS ReturnRatePercent
FROM online_sales_dataset
GROUP BY Category

4. Top 5 Products by Revenue

SELECT Top 5 Description,SUM(Quantity * UnitPrice * (1 - Discount)) AS Revenue
FROM online_sales_dataset
GROUP BY Description
ORDER BY Revenue DESC

5.  Monthly Sales Trend

SELECT format(InvoiceDate,'%Yy-%mm') AS Month,
       SUM(Quantity * UnitPrice * (1 - Discount)) AS MonthlyRevenue
FROM online_sales_dataset
GROUP BY format(InvoiceDate,'%Yy-%mm') 
ORDER BY Month

6. Top 10 Customers by Total Spend

SELECT CustomerID,SUM(Quantity * UnitPrice * (1 - Discount)) AS TotalSpent
FROM online_sales_dataset
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY TotalSpent DESC

7. Product Return Rate

SELECT Top 10 Description,
       COUNT(*) AS TotalOrders,
       SUM(CASE WHEN ReturnStatus = 'Returned' THEN 1 ELSE 0 END) AS ReturnedOrders,
       ROUND(100.0 * SUM(CASE WHEN ReturnStatus = 'Returned' THEN 1 ELSE 0 END) / COUNT(*), 2) AS ReturnRatePercent
FROM online_sales_dataset
GROUP BY Description
ORDER BY ReturnRatePercent DESC

8. Orders by Shipment Provider

SELECT ShipmentProvider, COUNT(*) AS TotalOrders
FROM online_sales_dataset
GROUP BY ShipmentProvider
ORDER BY TotalOrders DESC

9. Sales by Warehouse Location

SELECT WarehouseLocation,SUM(Quantity * UnitPrice * (1 - Discount)) AS TotalSales
FROM online_sales_dataset
GROUP BY WarehouseLocation
ORDER BY TotalSales DESC

10. Revenue by Payment Method

SELECT PaymentMethod,SUM(Quantity * UnitPrice * (1 - Discount)) AS Revenue
FROM online_sales_dataset
GROUP BY PaymentMethod
ORDER BY Revenue DESC

11. Average Discount by Category

SELECT Category,ROUND(AVG(Discount), 2) AS AvgDiscount
FROM online_sales_dataset
GROUP BY Category
















































































































