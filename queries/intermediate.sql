-- Join the necessary tables to find the total quantity of each pizza category ordered.
SELECT 
	pt.category,
    SUM(o.quantity) AS total_quantity
FROM pizza_types pt
JOIN pizzas p
ON pt.pizza_type_id = p. pizza_type_id
JOIN order_details o
ON o.pizza_id = p.pizza_id
GROUP BY pt.category
ORDER BY total_quantity DESC;


-- Determine the distribution of orders by hour of the day.
SELECT 
	HOUR(order_time)  AS orders_by_hour,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY HOUR(order_time);


-- Join relevant tables to find the category-wise distribution of pizzas.
SELECT 
	category,
    COUNT(name) AS total_pizzas
FROM pizza_types
GROUP BY category;


-- Group the orders by date and calculate the average number of pizzas ordered per day.
WITH cte_orders AS
(
SELECT 
	o.order_date,
    SUM(od.quantity) AS total_quantity
FROM orders o
JOIN order_details od
ON o.order_id = od.order_id
GROUP BY o.order_date
)
SELECT
    ROUND(AVG(total_quantity),0) AS avg_orders
FROM cte_orders;


-- Determine the top 3 most ordered pizza types based on revenue.
SELECT 
	pt.name,
    SUM(od.quantity * p.price) AS revenue
FROM pizza_types pt
JOIN pizzas p
ON pt.pizza_type_id = p.pizza_type_id
JOIN order_details od
ON od.pizza_id = p.pizza_id
GROUP BY pt.name
ORDER BY revenue DESC
LIMIT 3;
