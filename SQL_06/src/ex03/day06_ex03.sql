CREATE INDEX idx_person_discounts_unique ON person_discounts(person_id, pizzeria_id);
SET ENABLE_SEQSCAN = off;
EXPLAIN ANALYZE
SELECT *
FROM person_discounts
WHERE person_id = 1;
