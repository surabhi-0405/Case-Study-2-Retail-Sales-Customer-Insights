USE retail_sales_dw;

CREATE TABLE IF NOT EXISTS DimCustomer (
    CustomerID VARCHAR(4) PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NULL,
    Gender VARCHAR(20) NOT NULL,
    Region VARCHAR(50) NOT NULL,
    SSN CHAR(9) NOT NULL
);
