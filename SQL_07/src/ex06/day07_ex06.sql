 SELECT pizzeria.name, count(*) as count_of_orders,
    ROUND(AVG(price), 2) AS average_price,
    MAX(price) AS max_price,
    MIN(price) AS min_price
    FROM menu m
    JOIN person_order po ON m.id = po.menu_id
    JOIN pizzeria ON m.pizzeria_id = pizzeria.id
    GROUP BY pizzeria.name
    ORDER BY name;