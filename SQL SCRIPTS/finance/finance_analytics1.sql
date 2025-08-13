
/* 1️⃣ Question 1
As a product owner, I want to generate a report of individual product sales (aggregated on a monthly basis at the product level) for Amazon India customers for FY = 2021 so that I can track individual product sales and run further product analytics on it in Excel.

The report should have the following fields:

Month

Product Name & Variant

Sold Quantity

Gross Price Per Item

Gross Price Total */
select s.date,s.product_code,p.product,p.variant , s.sold_quantity, g.gross_price,
round(g.gross_price * s.sold_quantity,2) as gross_price_total
from fact_sales_monthly s
join dim_product p
using(product_code)
join fact_gross_price g
on g.product_code=s.product_code and
g.fiscal_year=get_fiscal_year(s.date)
where 
   customer_code=90002002 and 
   get_fiscal_year(date)=2021 
   #get_fiscal_quarter(date)="Q4"
order by date  asc;
