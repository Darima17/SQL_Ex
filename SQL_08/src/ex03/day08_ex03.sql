BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED; --s1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED; --s2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; --s1
UPDATE pizzeria
SET rating = 3.6
WHERE name = 'Pizza Hut'; --s2
COMMIT; --s2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; --s1
COMMIT; --s1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; --s1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; --s2