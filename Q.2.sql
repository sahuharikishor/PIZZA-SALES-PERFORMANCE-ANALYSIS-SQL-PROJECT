-- Calculate the total revenue generated from pizza sales.

SELECT 
    ROUND(SUM(order_details.Quantity * pizzas.price),
            2) AS 'Total Revenue'
FROM
    order_details
        JOIN
    pizzas ON pizzas.pizza_id = order_details.pizza_id;
    
    

SELECT * FROM pizzas;
SELECT * FROM order_details;