SET ENABLE_SEQSCAN = false;
SET ENABLE_INDEXSCAN = true;

EXPLAIN ANALYSE
SELECT pizza_name, pizzeria.name
FROM pizzeria
         JOIN menu ON pizzeria.id = menu.pizzeria_id