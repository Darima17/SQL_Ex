SELECT p.name, m.pizza_name, m.price, 
CAST(m.price - (m.price * pd.discount/100) AS INT) AS discount_price, 
pz.name as pizzeria_name
FROM person_order po
    JOIN person p ON po.person_id = p.id
    JOIN menu m ON po.menu_id = m.id
    JOIN pizzeria pz ON m.pizzeria_id = pz.id
    JOIN person_discounts pd ON po.person_id = pd.person_id AND m.pizzeria_id = pd.pizzeria_id
ORDER BY 1,2

