# 📊 Online Sales SQL Analysis

This project performs SQL-based analysis on an online sales dataset to uncover trends in revenue, order volume, and customer behavior over time.

## 📁 Dataset Overview

The dataset contains transactional sales data with the following key columns:

- `InvoiceNo` – Unique order ID
- `InvoiceDate` – Date and time of the transaction
- `StockCode`, `Description` – Product ID and name
- `Quantity` – Number of units purchased
- `UnitPrice` – Price per unit
- `Discount` – Discount applied
- `CustomerID` – Customer identifier
- `Country` – Country of purchase
- `PaymentMethod`, `ShippingCost`, `SalesChannel`, `ReturnStatus`, etc.

## 🎯 Analysis Objectives

We aim to:
- Calculate monthly revenue and order volume
- Identify top-performing months by revenue
- Track trends and performance across different years
- Limit data to specific periods when needed

## 🧾 SQL Queries

### 1. Monthly Revenue and Order Volume (All Time)
```sql
SELECT 
    EXTRACT(YEAR FROM InvoiceDate) AS Year,
    EXTRACT(MONTH FROM InvoiceDate) AS Month,
    SUM(Quantity * UnitPrice * (1 - Discount)) AS TotalRevenue,
    COUNT(DISTINCT InvoiceNo) AS OrderVolume
FROM online_sales_dataset
GROUP BY Year, Month
ORDER BY Year, Month;
