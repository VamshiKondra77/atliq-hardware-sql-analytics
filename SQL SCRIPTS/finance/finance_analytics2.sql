-- As a product owner, I need an aggregate monthly gross sales report for Croma India customer so that I can track how much sales this particular customer is generating for AtliQ and manage our relationships accordingly.

-- The report should have the following fields:

-- Month

-- Total gross sales amount to Croma India in this month
Select s.date, sum(round(g.gross_price*s.sold_quantity,2)) as total_gross_price from fact_sales_monthly s
join fact_gross_price g
on g.product_code=s.product_code and 
g.fiscal_year=get_fiscal_year(s.date)
where customer_code=90002002
group by s.date
order by s.date asc;
