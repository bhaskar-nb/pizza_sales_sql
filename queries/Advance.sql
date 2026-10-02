-- Calculate the percentage contribution of each pizza type to total revenue.
SELECT 
	pt.category,
    ROUND(SUM(od.quantity * p.price)  / (SELECT ROUND(SUM(od.quantity * p.price), 0)
	FROM order_details od
	JOIN pizzas p ON p.pizza_id = od.pizza_id) * 100, 2) AS revenue
FROM pizza_types pt
JOIN pizzas p
ON pt.pizza_type_id =  p.pizza_type_id
JOIN order_details od
ON p.pizza_id = od.pizza_id
GROUP BY pt.category
ORDER BY revenue DESC;


-- Analyze the cumulative revenue generated over time.
SELECT 
	order_date,
    ROUND(SUM(revenue) OVER(ORDER BY order_date), 0) AS cumulaative_revenue
FROM 
(SELECT 
	o.order_date,
    SUM(od.quantity * p.price) AS revenue
FROM order_details od
JOIN pizzas p
ON od.pizza_id = p.pizza_id
JOIN orders o
ON od.order_id = o.order_id
GROUP BY o.order_date) AS sales;


-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.
SELECT 
	name,
    revenue
FROM
(SELECT 
	category,
    name,
    revenue,
    RANK() OVER(PARTITION BY category ORDER BY revenue DESC) AS rn
FROM 
(SELECT 
	pt.category,
    pt.name,
    SUM(od.quantity * p.price) AS revenue
FROM pizza_types pt
JOIN pizzas p
ON pt.pizza_type_id = p.pizza_type_id
JOIN order_details od
ON od.pizza_id = p.pizza_id
GROUP BY 
	pt.category,
	pt.name
) AS t ) AS b
WHERE rn <= 3;
