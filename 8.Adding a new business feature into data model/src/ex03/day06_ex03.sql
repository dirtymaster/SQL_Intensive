CREATE UNIQUE INDEX idx_person_discounts_unique
    ON person_discounts (id, person_id, pizzeria_id);

SET ENABLE_SEQSCAN = false;
SET ENABLE_INDEXSCAN = true;

EXPLAIN ANALYSE
SELECT id
FROM person_discounts
WHERE person_id = 1
  AND pizzeria_id = 1