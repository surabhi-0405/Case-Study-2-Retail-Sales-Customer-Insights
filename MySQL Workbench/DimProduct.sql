USE retail_sales_dw;

CREATE TABLE IF NOT EXISTS DimProduct (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50) NOT NULL
);
