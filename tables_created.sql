USE Amex_Project;
GO

-- 1. Create Customer Dimension
CREATE TABLE Dim_Customers (
    cc_num BIGINT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender CHAR(1),
    job VARCHAR(100),
    dob DATE,
    street VARCHAR(255),
    city VARCHAR(100),
    state CHAR(2),
    zip INT,
    lat FLOAT,
    long FLOAT,
    city_pop INT
);

-- 2. Create Merchant Dimension
CREATE TABLE Dim_Merchants (
    merchant_id INT IDENTITY(1,1) PRIMARY KEY,
    merchant_name VARCHAR(255),
    category VARCHAR(100),
    merch_lat FLOAT,
    merch_long FLOAT
);

-- 3. Create Fact Table
CREATE TABLE Fact_Transactions (
    trans_num VARCHAR(100) PRIMARY KEY,
    trans_date_trans_time DATETIME,
    cc_num BIGINT FOREIGN KEY REFERENCES Dim_Customers(cc_num),
    merchant_id INT FOREIGN KEY REFERENCES Dim_Merchants(merchant_id),
    amt DECIMAL(10, 2),
    unix_time BIGINT,
    is_fraud BIT
);