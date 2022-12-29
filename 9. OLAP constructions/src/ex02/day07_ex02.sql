SELECT *
FROM (
         SELECT pizzeria.name,
                COUNT(pizzeria.id) AS count,
                'order'            AS action_type
         FROM person_order
                  JOIN menu on menu.id = person_order.menu_id
                  JOIN pizzeria on pizzeria.id = menu.pizzeria_id
         GROUP BY pizzeria.name
         ORDER BY count DESC
         LIMIT 3) AS foo
UNION
SELECT *
FROM (
         SELECT DISTINCT pizzeria.name,
                         COUNT(pizzeria.id) AS count,
                         'visit'            AS action_type
         FROM person_visits
                  JOIN pizzeria on pizzeria.id = person_visits.pizzeria_id
         GROUP BY pizzeria.name
         ORDER BY count DESC
         LIMIT 3
     ) AS bar
ORDER BY action_type, count DESC