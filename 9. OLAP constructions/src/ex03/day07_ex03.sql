WITH query AS (
    SELECT pizzeria.name, COUNT(pizzeria.id) AS count, 'visit' AS action_type
    FROM person_visits
             JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
    GROUP BY pizzeria.name
    UNION
    SELECT pizzeria.name, COUNT(pizzeria.id) AS COUNT, 'order' AS action_type
    FROM person_order
             JOIN menu ON menu.id = person_order.menu_id
             JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
    GROUP BY pizzeria.name
)
SELECT name, SUM(count) AS total_count
FROM query
GROUP BY name
ORDER BY total_count DESC, name ASC