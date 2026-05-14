# SQL Car Sales Business Analysis

## Overview
This project focuses on automotive sales analysis using SQL to answer business questions and generate strategic insights from vehicle sales data.

The analysis simulates a real-world business scenario where data is used to support decision-making, identify market trends, and evaluate vehicle performance.

---

## Objectives
- Practice SQL in real-world business scenarios
- Perform exploratory data analysis
- Solve business-related questions
- Build a professional portfolio project

---

## Business Questions
- Which brands generate the highest average selling price?
- Which fuel type dominates the market?
- Are automatic vehicles more expensive?
- Is there a relationship between engine size and vehicle price?
- Which models offer the best fuel efficiency?
- What is the average vehicle value by year?
- Which brands provide the best average fuel efficiency?
- Price segmentation
- Most expensive vehicles
- Which fuel type and transmission combination is the most common?

---

## Tools & Technologies
- SQL
- MySQL
- Power BI
---

## Demonstrated Skills
- Aggregations
- Window Functions
- CASE Statements
- Views
- Business Analysis
- Data Storytelling

---
## Example SQL Query

```sql
-- Most expensive vehicles
SELECT company, car_name, selling_price, transmission, engine_CC,
RANK() OVER(ORDER BY selling_price DESC) as TOP_5
FROM car_sales
LIMIT 5;
```
---

## Dashboard Preview

![Dashboard Preview](CarSalesPBI.png)

---

## Project Structure

```text
car-sales-sql-analysis/
│
├── datasets/
│   └── car_sales_analysis_dataset.csv
│
├── sql/
│   ├── database_setup.sql
│   ├── business_questions.sql
│   ├── views.sql
│   └── advanced_analysis.sql
│
├── dashboard/
│   └── car_sales_dashboard.pbix
│
├── images/
│   └── dashboard.png
│
└── README.md
```
