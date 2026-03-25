-- Determine the distribution of orders by hour of the day.

SELECT 
    HOUR(order_time) AS Hours, COUNT(order_id) AS Total_Order
FROM
    orders
GROUP BY HOUR(order_time);