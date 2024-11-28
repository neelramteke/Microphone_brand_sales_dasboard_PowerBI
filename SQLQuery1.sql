with cte as(
  select a.Product, a.Category, a.cost_price, a.sale_price, a.brand, a.Description, a.image_url,
         b.date, b.customer_type, b.discount_band, b.units_sold,
         (sale_price*units_sold) as revenue, 
         (cost_price*Units_Sold) as total_cost,
         FORMAT (date, 'MMMM') as month,
         FORMAT (date, 'yyyy') as year
  from Product_data as a
  join product_sales as b on b.Product = a.Product_ID
) 

select 
*,
(1- discount*0.1/100) * revenue as discount_revenue
from cte as a
join discount_data as b
on a.Discount_Band = b.Discount_Band and a.month = b.Month