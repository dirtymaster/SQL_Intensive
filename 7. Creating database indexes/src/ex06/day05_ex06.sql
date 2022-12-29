CREATE INDEX idx_1 ON pizzeria(rating);

EXPLAIN ANALYSE
SELECT m.pizza_name AS pizza_name,
       MAX(rating)
       OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
FROM menu m
         INNER JOIN pizzeria pz on m.pizzeria_id = pz.id
ORDER BY 1, 2