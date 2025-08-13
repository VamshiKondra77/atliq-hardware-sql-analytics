# atliq-hardware-sql-analytics
MySQL project analyzing AtliQ Hardware’s sales, marketing, finance, and supply chain data using advanced SQL concepts.
# 📊 AtliQ Hardware Sales, Finance & Supply Chain Analytics – MySQL Project

## 🔹 Project Overview
This project analyzes **AtliQ Hardware’s** sales, finance, and supply chain data to generate actionable business insights.  
It demonstrates advanced SQL concepts including joins, CTEs, stored procedures, triggers, functions, indexing, and query optimization.  
The goal is to deliver **finance analytics**, **top customer/market reports**, and **supply chain analytics** using MySQL.

**Tools & Technologies:**  
`MySQL Workbench` | `SQL Joins` | `CTEs` | `Stored Procedures` | `Functions` | `Database Triggers` | `Window Functions` | `Indexing`

---

## 📂 Dataset Details
- **Source:** AtliQ Hardware sample dataset
- **Size:** 10+ relational tables, millions of transactional records
- **Data Types:**
  - **Fact Tables:** Sales, Gross Price, Manufacturing Cost, Freight Cost, Forecast, Pre & Post Invoice Deductions
  - **Dimension Tables:** Customers, Products, Date
- **Time Period:** Multi-year data covering various markets, customers, and products

---

## 🗄 Database Structure

### 📋 Tables
- **Dimension Tables:**  
  - `dim_customer` – Customer details (market, region, segment)  
  - `dim_date` – Date dimension for time-series analysis  
  - `dim_product` – Product details (category, variant, etc.)  

- **Fact Tables:**  
  - `fact_sales_monthly` – Monthly sales transactions  
  - `fact_gross_price` – Product gross prices by year  
  - `fact_pre_invoice_deductions` – Discounts before invoicing  
  - `fact_post_invoice_deductions` – Discounts after invoicing  
  - `fact_forecast_monthly` – Forecasted sales  
  - `fact_freight_cost` – Shipment and freight costs  
  - `fact_manufacturing_cost` – Production costs 

---

### 👁 Views
- `net_sales` – Calculates net sales after deductions  
- `sales_postinv_discount` – Merges post-invoice discount data with sales  
- `sales_preinv_discount` – Merges pre-invoice discount data with sales  



---

### ⚙ Stored Procedures
- `get_market_badge` – Assigns performance badge to a market based on sales volume  
- `get_monthly_gross_sales_for_customer` – Retrieves monthly gross sales for a specific customer  
- `get_top_n_customers_by_net_sales` – Returns top N customers by net sales  
- `get_top_n_markets_by_net_sales` – Returns top N markets by net sales  

---

### 🧮 Functions
- `get_fiscal_year` – Returns the fiscal year from a given date  
- `get_fiscal_quarter` – Returns the fiscal quarter from a given date  

![Functions](images/functions.png)

---

## 🛠 SQL Features Implemented

### 1️⃣ Finance Analytics
- Created fiscal year & quarter functions (`get_fiscal_year`, `get_fiscal_quarter`)  
- Calculated **Gross & Net Sales** using advanced joins, CASE statements, and CTEs  
- Automated recurring reports with stored procedures

---

### 2️⃣ Top Customers, Products, Markets
- Developed ranking queries using `RANK()`, `DENSE_RANK()`, `ROW_NUMBER()`  
- Identified top-N markets/customers by sales  
- Built **views** for consolidated reporting

---

### 3️⃣ Supply Chain Analytics
- Designed **helper tables** for intermediate calculations  
- Implemented **database triggers/events** for automated updates  
- Used **temporary tables & CTEs** to prepare Forecast Accuracy Reports  
- Compared **subqueries vs CTEs vs views** for performance optimization

---

## ⚡ Performance Optimization
- Applied **composite indexes** and specialized indexing for faster queries  
- Used **EXPLAIN ANALYZE** to evaluate and improve query execution plans  
- Implemented user accounts & privileges for secure data access


