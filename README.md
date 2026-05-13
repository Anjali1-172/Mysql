# Financial Transaction Analytics & Fraud Detection System

## 📌 Project Overview
This project demonstrates an end-to-end Data Engineering and Business Intelligence pipeline. The system transforms raw transaction logs into structured insights using **SQL Server (SSMS)** for data modeling and **Generative AI BI tools** for advanced visualization. 

By implementing a **Star Schema** architecture, the project identifies fraudulent patterns, segments customers by value, and analyzes spending trends to support data-driven decision-making.

---

## 🏗️ Data Architecture & Modeling
The foundation of this project is a relational database optimized for analytics.

### 1. The Star Schema
*   **Fact_Transactions**: Central table containing transaction metrics (`amt`, `trans_num`, `is_fraud`).
*   **Dim_Customers**: Descriptive attributes of cardholders.
*   **Dim_Merchants**: Categorical data for merchants and spending types.

### 2. Analytical Layer (SQL Views)
To bridge the gap between raw data and the dashboard, I developed specific **SQL Views**. Since cloud-based BI tools cannot access local SSMS views directly, the results of these models were exported to ensure the dashboard reflects the pre-calculated business logic.

| View Name | Insight Type | Business Value |
| :--- | :--- | :--- |
| `active_inactive_customers` | Retention | Identifies churn by finding customers with no recent activity. |
| `customer_segmentation` | Marketing | Clusters users into High, Medium, and Low value based on `SUM(amt)`. |
| `hourly_frauds` | Security | pinpoints peak hours for fraudulent activity to optimize monitoring. |
| `MassivevelocityFrauds` | Threat Detection | Flags accounts hit by rapid, repetitive fraudulent charges. |
| `Top10Spenders` | VIP Analysis | Lists the most valuable customers for premium service offerings. |
| `Fraud_count_category` | Risk Analysis | Shows which merchant industries (Gas, Retail, etc.) are most vulnerable. |

---

## 🚀 Implementation Workflow

1.  **Data Cleaning & ETL**: Standardized raw datasets into normalized Dimension and Fact tables.
2.  **Schema Mapping**: Created Primary and Foreign Key relationships in SSMS to ensure data integrity.
3.  **Advanced Querying**: Developed T-SQL scripts using `GROUP BY`, `CASE` logic, and `Aggregate Functions`.
4.  **Generative BI Integration**: Exported View results as CSVs and utilized AI-driven dashboarding tools to generate interactive visuals.

---

## 📈 Dashboard Features
The final dashboard provides a "Command Center" view of the bank's health:
*   **KPI Cards**: Total Money Lost, Total Fraud Hits, and Active User Count.
*   **Behavioral Charts**: Breakdown of "High Value" vs. "Low Value" segments.
*   **Risk Heatmaps**: Concentration of fraud across different merchant categories.
*   **Time-Series Analysis**: Hourly fraud trends to detect "Dark Hour" attacks.

---

## 📂 File Structure
*   `SQL_Queries/`: Scripts for creating tables and views.
*   `Data_Results/`: CSV exports of the 6 core analytical views.
*   `Dashboard/`: Screenshots and PDF export of the AI-generated dashboard.
*   `README.md`: Project documentation.

---

## 🎓 Conclusion
This project proves that the power of Business Intelligence lies in the **Modeling Layer**. By using SQL Views to define business logic, we transformed millions of data points into 6 simple, actionable insights that can be visualized in any modern BI tool.
