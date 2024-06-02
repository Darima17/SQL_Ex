BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE; --s1
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE; -- s2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';--s1
UPDATE pizzeria
SET rating = 3.0
WHERE name = 'Pizza Hut'; --s2
COMMIT; --s2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; --s1
COMMIT; --s1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; --s1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; --s2