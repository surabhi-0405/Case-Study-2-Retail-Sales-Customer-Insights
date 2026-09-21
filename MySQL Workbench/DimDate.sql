USE retail_sales_dw;

CREATE TABLE IF NOT EXISTS DimDate (
    DateKey INT PRIMARY KEY,
    FullDate DATE NOT NULL,
    Year INT NOT NULL,
    MonthNumber INT NOT NULL,
    MonthName VARCHAR(20) NOT NULL,
    Quarter VARCHAR(2) NOT NULL,
    Day INT NOT NULL,
    DayName VARCHAR(20) NOT NULL,
    DayOfWeek INT NOT NULL
);
