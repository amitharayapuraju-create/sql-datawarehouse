-- Product report

CREATE VIEW gold.report_products as
with base_query as (
SELECT
p.product_key,
p.product_name,
p.category,
p.subcategory,
p.cost,
f.order_date,
f.order_number,
f.customer_key,
f.sales_amount,
f.quantity
from gold.dim_products p
left join gold.fact_sales f 
on p.product_key = f.product_key
where order_date is not null
), cte2 as (
select
product_key,
product_name,
category,
subcategory,
cost,
DATEDIFF(month,min(order_date),max(order_date)) as lifespan,
max(order_date) as last_sale_date,
Count(distinct order_number) as total_orders,
Count(distinct customer_key) as total_Customers,
sum(sales_amount) as total_sales,
sum(quantity) as total_quantity,
avg(sales_amount / quantity) as avg_selling_price
from base_query
group by
product_key,
product_name,
category,
subcategory,
cost
)
select 
product_key,
product_name,
category,
subcategory,
cost,
last_sale_date,
datediff(month,last_sale_date,getdate()) as recency_in_months,
case
 when total_sales >= 50000 then 'High-Performer'
 when total_sales >= 100 then 'Mid-Range'
 else 'Low Performer'
end as product_segment,
lifespan,
total_orders,
total_sales,
total_quantity,
total_customers,
avg_selling_price,
case
 when total_orders = 0 then 0
 else total_sales / total_orders
end as avg_order_revenue,
case
 when lifespan = 0 then total_sales
 else total_sales/lifespan
end as avg_monthly_revenue
from cte2;
