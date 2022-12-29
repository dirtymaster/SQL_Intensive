INSERT INTO person_discounts
SELECT row_number() over (), *
FROM (
         SELECT DISTINCT person.id   AS person_id,
                         pizzeria.id AS pizzeria_id,
                         CASE
                             WHEN (SELECT COUNT(id)
                                   FROM person_order
                                   WHERE person_id = person.id
                                     AND menu.pizzeria_id = pizzeria.id) = 1
                                 THEN 10.5
                             WHEN (SELECT COUNT(id)
                                   FROM person_order
                                   WHERE person_id = person.id
                                     AND menu.pizzeria_id = pizzeria.id) = 2
                                 THEN 22
                             ELSE 30
                             END     AS discount
         FROM person
                  CROSS JOIN pizzeria
                  JOIN person_order ON person.id = person_order.person_id
                  JOIN menu ON person_order.menu_id = menu.id) AS foo