-- URL: https://platform.stratascratch.com/coding/9915-highest-cost-orders
with a as
(
select distinct c.first_name, o.order_date,
sum(o.total_order_cost) as total_order_cost,
dense_rank() over(partition by o.order_date order by sum(o.total_order_cost) desc) as ranks 
from customers c inner join orders o
on c.id = o.cust_id
where order_date between '2019-02-01' and '2019-05-01'
group by c.first_name, o.order_date
order by o.order_date, sum(o.total_order_cost) desc
)
select first_name, order_date, total_order_cost as max_cost
from a
where ranks = 1
order by order_date, total_order_cost desc
;
