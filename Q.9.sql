-- Group the orders by date and calculate the average number of pizzas ordered per day.


SELECT 
    ROUND(AVG(Pizzas_par_day), 2) AS Avg_num_pizzas
FROM
    (SELECT 
        DATE(orders.order_date) AS Order_day,
            SUM(order_details.Quantity) AS Pizzas_par_day
    FROM
        orders
    JOIN order_details ON orders.order_id = order_details.order_id
    GROUP BY DATE(order_date)) AS Daily_Orders;

