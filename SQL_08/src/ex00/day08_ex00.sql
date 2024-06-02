BEGIN; --s1
BEGIN; --s2
UPDATE pizzeria
SET rating = 5
WHERE name = 'Pizza Hut'; --s1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; --s1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; --s2
COMMIT; --s1
-- after commit
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; --s2