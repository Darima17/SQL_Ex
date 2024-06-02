BEGIN; --1
BEGIN; --2
UPDATE pizzeria
SET rating = 1
WHERE id = 1; --s1
UPDATE pizzeria
SET rating = 2
WHERE id = 2; --s2
UPDATE pizzeria
SET rating = 3
WHERE id = 2; --s1
UPDATE pizzeria
SET rating = 3
WHERE id = 1; --s2
COMMIT; --s1
COMMIT; --s2