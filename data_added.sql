USE Amex_Project;
GO

-- A professional Star Schema.

/* In the raw data, a customer appears every time they buy something.
If you try to insert them twice into Dim_Customers, the Primary Key will error out.
MAX() ensures we pick one version of their name/job to satisfy the "Unique" requirement.*/

-- Step 1: Load Dimensions (Handling duplicates with MAX/DISTINCT)
INSERT INTO Dim_Customers (cc_num, first_name, last_name, gender, job, dob, street, city, state, zip, lat, long, city_pop)
SELECT TOP 1000 cc_num, MAX(first), MAX(last), MAX(gender), MAX(job), MAX(dob), 
       MAX(street), MAX(city), MAX(state), MAX(zip), MAX(lat), MAX(long), MAX(city_pop)
FROM credit_card_transaction GROUP BY cc_num;

INSERT INTO Dim_Merchants (merchant_name, category, merch_lat, merch_long)
SELECT DISTINCT TOP 1000 merchant, category, merch_lat, merch_long
FROM credit_card_transaction;




-- Step 2: Load Fact Table (Handling duplicate trans_num)
WITH UniqueTxns AS (
    SELECT r.*, m.merchant_id,
          -- ROW_NUMBER() function adds a new column (aliased as rn) that assigns a number (1, 2, 3...) to each row based on rules.
          -- In a window function with PARTITION BY, you keep all your rows, but you divide them into invisible "buckets" to perform a calculation inside each bucket.
           ROW_NUMBER() OVER (PARTITION BY r.trans_num ORDER BY r.trans_date_trans_time) as rn
    FROM credit_card_transaction r
    JOIN Dim_Merchants m ON r.merchant = m.merchant_name AND r.category = m.category
    JOIN Dim_Customers c ON r.cc_num = c.cc_num
)
INSERT INTO Fact_Transactions (trans_num, trans_date_trans_time, cc_num, merchant_id, amt, unix_time, is_fraud)
SELECT TOP 1000 trans_num, trans_date_trans_time, cc_num, merchant_id, amt, unix_time, is_fraud
-- If a transaction was accidentally recorded twice, it assigns rn = 1 to the earliest one and rn = 2 to the duplicate.
FROM UniqueTxns WHERE rn = 1;

/* A. The JOIN Strategy
we didn't just copy the raw data. We used a JOIN to replace the descriptive merchant names with their
corresponding merchant_id means we took those merchants id(string) who are present in merchant table as merchant_name
and we want only those merchant who are present in merchant table.
Clause: JOIN Dim_Merchants m ON r.merchant = m.merchant_name
Purpose: This is called Surrogate Key Mapping. It's much faster for a computer to search
for an integer (ID) than a long string (Merchant Name).

B. Handling the Duplicate PK Violation (The trans_num Issue)
Your raw data had some duplicate trans_num values. Since trans_num is our Primary Key,
SQL would have crashed if we tried to insert both.
The Solution: We used a CTE (Common Table Expression) with ROW_NUMBER().
The Clause: ROW_NUMBER() OVER (PARTITION BY r.trans_num ORDER BY r.trans_date_trans_time)
The Logic: This "groups" all identical transaction IDs and gives them a rank (1, 2, 3...).
By then saying WHERE rn = 1, we told SQL: "If you see the same transaction ID twice, only keep the first 
one and ignore the rest."

C. Data Integrity (The Foreign Keys)
The Clause: ALTER TABLE Fact_Transactions ADD CONSTRAINT FK_Fact_Customers...
Purpose: This ensures that you can't have a transaction for a customer
who doesn't exist in your Dim_Customers table. This is the "Amex Standard"—it keeps the data clean and
prevents "ghost" transactions. */
