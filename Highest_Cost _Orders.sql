{\rtf1\ansi\ansicpg1252\cocoartf2822
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 with a as\
(\
select distinct c.first_name, o.order_date,\
sum(o.total_order_cost) as total_order_cost,\
dense_rank() over(partition by o.order_date order by sum(o.total_order_cost) desc) as ranks \
from customers c inner join orders o\
on c.id = o.cust_id\
where order_date between '2019-02-01' and '2019-05-01'\
group by c.first_name, o.order_date\
order by o.order_date, sum(o.total_order_cost) desc\
)\
select first_name, order_date, total_order_cost as max_cost\
from a\
where ranks = 1\
order by order_date, total_order_cost desc\
;}