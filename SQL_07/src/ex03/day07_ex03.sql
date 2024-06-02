WITH c_visits AS (
    SELECT name, count(*) as count
    FROM person_visits pv
    JOIN pizzeria ON pv.pizzeria_id = pizzeria.id
    GROUP BY pizzeria.name
), c_orders AS (
    SELECT pizzeria.name, count(*) as count
    FROM menu m
    JOIN person_order po ON m.id = po.menu_id
    JOIN pizzeria ON m.pizzeria_id = pizzeria.id
    GROUP BY pizzeria.name)
SELECT c_visits.name, (c_visits.count +  COALESCE(c_orders.count, 0)) AS total_count
FROM c_visits
LEFT JOIN c_orders ON c_visits.name = c_orders.name
ORDER BY total_count DESC, name;

