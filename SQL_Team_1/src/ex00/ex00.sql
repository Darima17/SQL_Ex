WITH p_m AS (
    SELECT user_id, currency_id, type, SUM(money) AS volume
    FROM balance
    GROUP BY user_id, currency_id, type
), c_e AS (
    SELECT id, name, rate_to_usd
    FROM currency
    WHERE updated IN (
        SELECT max_date
        FROM (
            SELECT id, name, MAX(updated) AS max_date
            FROM currency
            GROUP BY id, name
        ) AS s
    )
)
SELECT 
    COALESCE("user".name, 'not defined') AS name,
    COALESCE("user".lastname, 'not defined') AS lastname,
    p_m.type,
    p_m.volume,
    COALESCE(c_e.name, 'not defined') AS currency_name,
    COALESCE(c_e.rate_to_usd, 1) AS last_rate_to_usd,
    CAST((COALESCE(c_e.rate_to_usd, 1) * p_m.volume) AS REAL) AS total_volume_in_usd
FROM "user"
FULL JOIN p_m ON "user".id = p_m.user_id
FULL OUTER JOIN c_e ON c_e.id = p_m.currency_id
ORDER BY name DESC, lastname, type;