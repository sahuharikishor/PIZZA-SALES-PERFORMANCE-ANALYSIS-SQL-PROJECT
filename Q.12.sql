-- Analyze the cumulative revenue generated over time.
SELECT order_date ,
SUM(Revenue) OVER(ORDER BY order_date) AS Cum_Revenue
FROM
(SELECT orders.order_date, ROUND(SUM(order_details.Quantity*pizzas.price),2) AS Revenue
FROM order_details JOIN pizzas 
ON order_details.pizza_id = pizzas.pizza_id JOIN orders
ON order_details.order_id = orders.order_id 
GROUP BY orders.order_date) AS Sales;

