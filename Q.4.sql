-- Identify the most common pizza size ordered.

SELECT 
    pizzas.size,
    COUNT(order_details.order_details_id) AS Common_Pizza_Size_Order
FROM
    pizzas
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizzas.size
ORDER BY Common_Pizza_Size_Order DESC;



-- SELECT * FROM pizzas;
-- SELECT * FROM order_details;