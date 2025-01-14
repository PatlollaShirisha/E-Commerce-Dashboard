# KPI1: Weekday Vs Weekend (order_purchase_timestamp) payment statistics
create table KPI1
select orders.order_id,orders.order_purchase_timestamp,payment.payment_value,payment.payment_type from
olist_orders_dataset as orders
left join olist_order_payments_dataset as payment
on orders.order_id = payment.order_id;
# select * from KPI1; 
# select dayname(order_purchase_timestamp) from olist_orders_dataset; /* to extract the day name(Monday,Tuesday....) from order_purchase_timestamp */

# Sql Query to get the outcome of KPI1 
select 
if (dayname(order_purchase_timestamp) in ("sunday","saturday"), "weekend","weekday") as Day_of_week,
concat(round(sum(payment_value/1000000),2),'M') as Total_payment from KPI1
group by Day_of_week;




# KPI2: Number of Orders with review score 5 & payment type as credit card
create table KPI2
select orders.order_id, reviews.review_score,payment.payment_type from olist_orders_dataset as orders 
left join olist_order_reviews_dataset as reviews on 
orders.order_id = reviews.order_id
left join olist_order_payments_dataset as payment on
orders.order_id = payment.order_id;

# Sql Query to get the outcome of KPI2
select review_score, payment_type, count(distinct order_id) as Total_Orders from KPI2
where review_score = 5 and payment_type = "credit_card";

# KPI3 : Average no of days taken for order_delivered_customer_date for pet_shop
create table KPI3
select orders.order_id, items.product_id,products.product_category_name,orders.order_delivered_customer_date, orders.order_purchase_timestamp
from olist_order_items_dataset as items
left join olist_products_dataset as products on
items.product_id = products.product_id
left join olist_orders_dataset as orders on
items.order_id = orders.order_id;

# Sql Query to get the outcome of KPI3
select round(avg(DATEDIFF(order_delivered_customer_date, order_purchase_timestamp)),0) as Avg_delivery_days from KPI3
where product_category_name = "pet_shop";

# KPI4: Avg Price & Payment values from customers of Sao Paulo city
create table KPI4
select orders.order_id, customers.customer_id,customers.customer_city,items.price,payments.payment_value
from olist_orders_dataset as orders
left join olist_customers_dataset as customers
on orders.customer_id = customers.customer_id
left join olist_order_items_dataset as items
on orders.order_id = items.order_id
left join olist_order_payments_dataset as payments
on orders.order_id = payments.order_id;

# Sql Query to get the outcome of KPI4
select round(avg(price),0) as Avg_Price,round(avg(payment_value),0) as Avg_Payment_Value from KPI4
where customer_city = "Sao paulo";

# KPI5 : Relationship between Shipping Days Vs Review Scores
create table KPI5
select orders.order_id,orders.order_delivered_customer_date, orders.order_purchase_timestamp ,reviews.review_score
from olist_orders_dataset as orders
left join olist_order_reviews_dataset as reviews
on orders.order_id = reviews.order_id;

# Sql Query to get the outcome of KPI5
select review_score,round(avg(DATEDIFF(order_delivered_customer_date, order_purchase_timestamp)),0) as Shipping_Days from KPI5
where review_score is not null
group by review_score 
order by review_score;


# KPI Cards
# Total_Customers
select count(customer_id) as Total_Customers from olist_customers_dataset;

# Total_Products
select count(product_id) as Total_Products from olist_products_dataset;

# Total_Payment
select concat(round(sum(payment_value/1000000),2),'M') as Total_payment from olist_order_payments_dataset;

# Total_price
select concat(round(sum(price/1000000),2),'M') as Total_price from olist_order_items_dataset;


