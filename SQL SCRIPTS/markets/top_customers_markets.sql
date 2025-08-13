/*
==============================================================
Query: Top 5 Customers by Net Sales in 2021 with Regional Share
Category: Top Customers, Products, Markets
Purpose:
  - Identify the top 5 customers (by region) based on net sales in FY 2021
  - Calculate each customer’s percentage share of the region’s total net sales
==============================================================
*/

-- Step 1: CTE to get Top 5 Customers by Net Sales (in millions)
WITH cte_top_customers AS (
    SELECT 
        c.customer,
        c.region,
        ROUND(SUM(n.net_sales) / 1000000, 2) AS net_sales_mln
    FROM gdb0041.net_sales AS n
    JOIN gdb0041.dim_customer AS c 
        ON n.customer_code = c.customer_code
    WHERE fiscal_year = 2021
    GROUP BY c.customer, c.region
    ORDER BY net_sales_mln DESC
    LIMIT 5
)

-- Step 2: Calculate % Share of Net Sales within Region
SELECT 
    customer,
    region,
    net_sales_mln,
    ROUND(net_sales_mln * 100 / SUM(net_sales_mln) OVER (PARTITION BY region), 6) AS pct_share_region
FROM cte_top_customers
ORDER BY net_sales_mln DESC;
