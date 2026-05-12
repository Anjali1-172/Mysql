USE Amex_Project;
GO


/*Total Spend per Customer*/
SELECT 
    c.cc_num, 
    c.first_name, 
    c.last_name, 
    SUM(f.amt) AS total_lifetime_spend,
    COUNT(f.trans_num) AS total_transactions
FROM Dim_Customers c
JOIN Fact_Transactions f ON c.cc_num = f.cc_num
GROUP BY c.cc_num, c.first_name, c.last_name
ORDER BY total_lifetime_spend DESC;


/*CustomerSegmenatation: categorizes customer base for marketing campaigns*/
SELECT 
    cc_num,
    SUM(amt) AS total_spend,
    CASE 
        WHEN SUM(amt) > 5000 THEN 'High Value'
        WHEN SUM(amt) BETWEEN 1000 AND 5000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment
FROM Fact_Transactions
GROUP BY cc_num;


/*Top 10 Customers*/
WITH RankedSpend AS (
    SELECT 
        c.first_name, 
        c.last_name, 
        SUM(f.amt) AS total_spend,
        -- RANK(): 1, 2, 2, 4 (It skips a number to "punish" the tie).
        -- DENSE_RANK(): 1, 2, 2, 3 (It keeps the numbers strictly sequential. No numbers are skipped).
        DENSE_RANK() OVER (ORDER BY SUM(f.amt) DESC) as spend_rank
    FROM Dim_Customers c
    JOIN Fact_Transactions f ON c.cc_num = f.cc_num
    GROUP BY c.first_name, c.last_name
)
SELECT * FROM RankedSpend WHERE spend_rank <= 10;


/*Monthly revenue trends*/
SELECT
    FORMAT(trans_date_trans_time, 'yyyy-MM') AS report_month,
    SUM(amt) AS monthly_revenue
FROM Fact_Transactions
GROUP BY FORMAT(trans_date_trans_time, 'yyyy-MM')
ORDER BY report_month;



