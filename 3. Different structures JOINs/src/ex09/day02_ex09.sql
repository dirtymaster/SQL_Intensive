SELECT DISTINCT name
FROM person
         JOIN person_order on person.id = person_order.person_id
         JOIN menu on person_order.menu_id = menu.id
WHERE person.gender = 'female'
  AND menu.pizza_name = 'pepperoni pizza'
INTERSECT
SELECT DISTINCT name
FROM person
         JOIN person_order on person.id = person_order.person_id
         JOIN menu on person_order.menu_id = menu.id
WHERE person.gender = 'female'
  AND menu.pizza_name = 'cheese pizza'
ORDER BY name