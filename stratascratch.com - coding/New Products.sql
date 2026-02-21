-- URL: https://platform.stratascratch.com/coding/10318-new-products

with a as
(
select company_name,
count(distinct case when year = 2019 then product_name end) as prod_2019,
count(distinct case when year = 2020 then product_name end) as prod_2020
from car_launches
group by company_name
)
select company_name, (prod_2020 - prod_2019) as net_products
from a
;
