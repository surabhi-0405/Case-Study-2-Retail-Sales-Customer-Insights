USE retail_sales_dw;

CREATE TABLE IF NOT EXISTS FactSales (
    SaleID INT PRIMARY KEY,
    SourceSaleID VARCHAR(36) NOT NULL UNIQUE,
    ProductID INT NOT NULL,
    CustomerID VARCHAR(4) NOT NULL,
    DateKey INT NOT NULL,
    SalesAmount DECIMAL(10,2) NOT NULL,
    Quantity INT NOT NULL,
    Timestamp DATETIME NOT NULL,

    CONSTRAINT fk_factsales_customer
        FOREIGN KEY (CustomerID)
        REFERENCES DimCustomer(CustomerID),

    CONSTRAINT fk_factsales_product
        FOREIGN KEY (ProductID)
        REFERENCES DimProduct(ProductID),

    CONSTRAINT fk_factsales_date
        FOREIGN KEY (DateKey)
        REFERENCES DimDate(DateKey)
); 
