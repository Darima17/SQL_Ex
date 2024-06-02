insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');
WITH time AS (
    SELECT ba.user_id, ba.money, ba.currency_id,
        (
            SELECT c.rate_to_usd
            FROM currency c
            WHERE c.updated <= ba.updated
                AND c.id = ba.currency_id
            ORDER BY c.updated DESC
            LIMIT 1
        ) AS t1,
        (
            SELECT c.rate_to_usd
            FROM currency c
            WHERE c.updated >= ba.updated
                AND c.id = ba.currency_id
            ORDER BY c.updated
            LIMIT 1
        ) AS t2
    FROM balance ba
)
SELECT COALESCE(u.name, 'not defined') AS name,
       COALESCE(u.lastname, 'not defined') AS lastname,
       c.name AS currency_name,
       CAST((COALESCE(time.t1, time.t2) * time.money) AS FLOAT) AS currency_in_usd
FROM balance b
LEFT JOIN "user" u ON u.id = b.user_id
LEFT JOIN time ON b.user_id = time.user_id
RIGHT JOIN currency c ON c.id = time.currency_id
GROUP BY u.name, currency_in_usd, lastname, currency_name
ORDER BY name DESC, lastname, currency_name;
