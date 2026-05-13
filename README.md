# High-Performance SQL Data Modeling & AI-Driven Analytics

## 📌 Project Strategy: Data Engineering First
In modern analytics, the quality of a dashboard is determined by the quality of the underlying data model. This project focuses heavily on **Advanced SQL Engineering** to transform millions of raw data points into structured "Actionable Intelligence." 

While traditional tools like Power BI or Tableau are standard, this project explores the **Emerging AI Era**, utilizing Artificial Intelligence to visualize the complex models built in SQL Server (SSMS).

---

## 🏗️ Core Engineering: The SQL Data Model
The primary achievement of this project is the design of a **Star Schema** that optimizes query speed and data accuracy.

### 1. Database Architecture
*   **Normalization & Integrity**: Developed a structured relational environment using Primary and Foreign Keys to eliminate data redundancy.
*   **Fact & Dimension Strategy**: Isolated transactional metrics from descriptive attributes to allow for multi-dimensional analysis.

### 2. The Analytical Engine (SQL Views)
I engineered six specialized **SQL Views**. These aren't just queries; they represent the "Brain" of the project where all mathematical and logical heavy-lifting is performed.

| View Name | Technical Logic | Insight Generated |
| :--- | :--- | :--- |
| `active_inactive_customers` | Aggregation & Date Diff | Identifies churn by detecting users with no recent activity. |
| `customer_segmentation` | Conditional Case Logic | Categorizes users into High, Medium, and Low-value tiers. |
| `hourly_frauds` | Time-Series Extraction | Maps fraud frequency to specific hours of the day. |
| `MassivevelocityFrauds` | High-Frequency Filtering | Identifies compromised accounts hit by rapid-fire fraud. |
| `Top10Spenders` | Ranking & Sorting | Isolates top-tier customers contributing to total volume. |
| `Fraud_count_category` | Multi-Table Joins | Ranks merchant industries by their total fraud vulnerability. |

---

## 🤖 Visualization: The AI Analytics Layer
Recognizing the shift toward **Generative BI**, I utilized Artificial Intelligence to visualize the outputs of my SQL models.

*   **The AI Workflow**: Rather than manually designing charts, I provided the AI with the **pre-calculated results** of my SQL Views. 
*   **Logic Preservation**: By doing the heavy computation in SQL first, I ensured that the AI-generated dashboard remained accurate and grounded in strict database logic.
*   **Efficiency**: This approach demonstrates how a strong SQL foundation allows for near-instant dashboard generation in the AI era.

---

## 📂 Project Assets
*   **Backend**: T-SQL Scripts (DDL/DML) and Star Schema Diagram.
*   **Middleware**: Structured CSV exports representing the 6 Analytical Views.
*   **Frontend**: Interactive AI-generated dashboard screenshots and reports.

---

## 🎓 Conclusion
The core thesis of this project is that **AI is only as good as the data it receives**. By focusing on rigorous SQL modeling, I created a "Plug-and-Play" data architecture. This proves that a BCA professional's most valuable skill is the ability to engineer data that is "AI-Ready."
