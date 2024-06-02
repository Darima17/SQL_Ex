
WITH c_visits AS (
    SELECT name, count(*) as count, 'visit' as action_type
    FROM person_visits pv
    JOIN pizzeria ON pv.pizzeria_id = pizzeria.id
    GROUP BY pizzeria.name
    ORDER BY count DESC, pizzeria.name
    LIMIT 3
), c_orders AS (
    SELECT pizzeria.name, count(*) as count, 'order' as action_type
    FROM menu m
    JOIN person_order po ON m.id = po.menu_id
    JOIN pizzeria ON m.pizzeria_id = pizzeria.id
    GROUP BY pizzeria.name
    ORDER BY count DESC, pizzeria.name
    LIMIT 3)
SELECT * FROM c_orders
UNION ALL
SELECT * FROM c_visits
ORDER BY action_type, count DESC

