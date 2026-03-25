-- Join relevant tables to find the category-wise distribution of pizzas.

SELECT 
    category, COUNT(name) AS Total_items
FROM
    pizza_types
GROUP BY Category;