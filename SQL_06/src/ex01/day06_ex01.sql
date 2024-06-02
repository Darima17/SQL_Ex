INSERT INTO person_discounts (id, person_id, pizzeria_id, discount)
SELECT ROW_NUMBER() OVER (ORDER BY o.person_id, m.pizzeria_id) AS id,
       o.person_id,
       m.pizzeria_id,
       CASE
           WHEN COUNT(o.person_id) = 1 THEN 10.5
           WHEN COUNT(o.person_id) = 2 THEN 22
           ELSE 30
       END AS discount
FROM person_order o
         JOIN (SELECT id, pizzeria_id FROM menu) AS m
	ON m.id = o.menu_id
GROUP BY person_id, pizzeria_id;