BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED; --s1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED; --s2
SELECT SUM(rating) FROM pizzeria; --s1
UPDATE pizzeria
SET rating = 1
WHERE name = 'Pizza Hut'; --s2
COMMIT; --s2
SELECT SUM(rating) FROM pizzeria; --s1
COMMIT; --s1
SELECT SUM(rating) FROM pizzeria; --s1
SELECT SUM(rating) FROM pizzeria; --s2
