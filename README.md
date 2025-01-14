# E-Commerce_Olist store Analysis
<b>Overview:</b>  
The OLIST STORE is an e-commerce business headquartered in Brazil. This firm acts as a single point of contact between various small businesses and the customers who wish to buy their products. In this project the analysis is based on 9 input files in CSV format and a schema depicting how these tables are connected. After connecting all the 9 files, analyzed the entire dataset.
this project covered several KPI's such as weekday vs weekend payment statistics,delivery days taken,payment with review scores and average shipping days.

<b>Data Modelling:</b>  
Used joins to create relationship between data tables in powerbi.The Entity Relationship Diagram(ERD) below shows the connectivity between the 9 data tables used in our analysis.
![E-Commerce_Schema](https://github.com/user-attachments/assets/8003eea8-1611-48e1-ad1d-9c3d626fc8e7)
The description of these tables is as follows:

<b>olist_orders_dataset:</b> It is used to connect all the details related to an order, including Order_id,Purchase timestamp and customer delivery date and so on

<b>olist_order_items_dataset:</b> It contains the details of an item that had been purchased such as freight value, price and so on.

<b>olist_order_reviews_dataset:</b> It contains details related to any reviews posted by the customer on a particular product that he had purchased.

<b>olist_products_dataset:</b> It contains related to a product such as the Product ID, Product category name and measurements.

<b>olist_order_payments_dataset:</b> The information contained in this table is related to the payment details associated with a particular order type.

<b>olist_customers_dataset:</b> Details the customer base information of this firm.

<b>olist_geolocation_dataset:</b> It contains geographical information related to both the sellers and customers.

<b>olist_sellers_dataset:</b> This table contains the information related to all the sellers who have registered with this firm.

<b>olist_product_category_name_translation:</b> This table is connected to products database.

Individual datasets were cleaned using Power Query in a Power bi before importing the data tables to powerbi. SQL left joins were used to connect relevant data tables for our My Sql.




 
