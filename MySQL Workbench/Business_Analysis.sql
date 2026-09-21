-- ============================================================
-- SALES BY PRODUCT CATEGORY
-- ============================================================

USE retail_sales_dw;

SELECT
    p.Category,
    COUNT(f.SaleID) AS Total_Transactions,
    SUM(f.Quantity) AS Total_Quantity_Sold,
    SUM(f.SalesAmount) AS Total_Sales_Revenue,
    AVG(f.SalesAmount) AS Average_Transaction_Value
FROM FactSales f
JOIN DimProduct p
    ON f.ProductID = p.ProductID
GROUP BY p.Category
ORDER BY Total_Sales_Revenue DESC;


-- ============================================================
-- BEST-SELLING PRODUCTS BY SALES REVENUE
-- ============================================================

SELECT
    p.ProductID,
    p.ProductName,
    p.Category,
    SUM(f.Quantity) AS Total_Quantity_Sold,
    SUM(f.SalesAmount) AS Total_Sales_Revenue
FROM FactSales f
JOIN DimProduct p
    ON f.ProductID = p.ProductID
GROUP BY
    p.ProductID,
    p.ProductName,
    p.Category
ORDER BY Total_Sales_Revenue DESC;


-- ============================================================
-- REGIONAL SALES PERFORMANCE
-- ============================================================

SELECT
    c.Region,
    COUNT(f.SaleID) AS Total_Transactions,
    SUM(f.Quantity) AS Total_Quantity_Sold,
    SUM(f.SalesAmount) AS Total_Sales_Revenue,
    AVG(f.SalesAmount) AS Average_Transaction_Value
FROM FactSales f
JOIN DimCustomer c
    ON f.CustomerID = c.CustomerID
GROUP BY c.Region
ORDER BY Total_Sales_Revenue DESC;


-- ============================================================
-- USTOMER SEGMENTATION AND PURCHASE BEHAVIOR
-- ============================================================

SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    c.Gender,
    c.Region,
    COUNT(f.SaleID) AS Total_Transactions,
    SUM(f.Quantity) AS Total_Quantity_Purchased,
    SUM(f.SalesAmount) AS Total_Sales_Revenue,
    AVG(f.SalesAmount) AS Average_Transaction_Value
FROM FactSales f
JOIN DimCustomer c
    ON f.CustomerID = c.CustomerID
GROUP BY
    c.CustomerID,
    c.FirstName,
    c.LastName,
    c.Gender,
    c.Region
ORDER BY Total_Sales_Revenue DESC;


-- ============================================================
-- CUSTOMER PURCHASE FREQUENCY
-- ============================================================

SELECT
    f.CustomerID,
    COUNT(f.SaleID) AS Purchase_Frequency
FROM FactSales f
GROUP BY f.CustomerID
ORDER BY Purchase_Frequency DESC;


-- ============================================================
-- Top 10 CUSTOMERS BY REVENUE
-- ============================================================

SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    c.Region,
    SUM(f.SalesAmount) AS Total_Sales_Revenue
FROM FactSales f
JOIN DimCustomer c
    ON f.CustomerID = c.CustomerID
GROUP BY
    c.CustomerID,
    c.FirstName,
    c.LastName,
    c.Region
ORDER BY Total_Sales_Revenue DESC
LIMIT 10;


-- ============================================================
-- SALES BY GENDER AND REGION
-- ============================================================

SELECT
    c.Gender,
    c.Region,
    COUNT(f.SaleID) AS Total_Transactions,
    SUM(f.Quantity) AS Total_Quantity_Sold,
    SUM(f.SalesAmount) AS Total_Sales_Revenue
FROM FactSales f
JOIN DimCustomer c
    ON f.CustomerID = c.CustomerID
GROUP BY
    c.Gender,
    c.Region
ORDER BY Total_Sales_Revenue DESC;


-- ============================================================
-- PRODUCT PERFORMANCE - REVENUE VS QUANTITY
-- ============================================================

SELECT
    p.ProductID,
    p.ProductName,
    p.Category,
    SUM(f.Quantity) AS Total_Quantity_Sold,
    SUM(f.SalesAmount) AS Total_Sales_Revenue
FROM FactSales f
JOIN DimProduct p
    ON f.ProductID = p.ProductID
GROUP BY
    p.ProductID,
    p.ProductName,
    p.Category
ORDER BY Total_Sales_Revenue DESC;


-- ============================================================
-- CATEGORY CONTRIBUTION TO TOTAL REVENUE
-- ============================================================

SELECT
    p.Category,
    SUM(f.SalesAmount) AS Category_Revenue,
    ROUND(
        SUM(f.SalesAmount) /
        (SELECT SUM(SalesAmount) FROM FactSales) * 100,
        2
    ) AS Revenue_Contribution_Percentage
FROM FactSales f
JOIN DimProduct p
    ON f.ProductID = p.ProductID
GROUP BY p.Category
ORDER BY Category_Revenue DESC;
