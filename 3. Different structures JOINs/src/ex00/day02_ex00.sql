SELECT name, rating
FROM pizzeria
         LEFT JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
         LEFT OUTER JOIN (
    SELECT name AS name2, rating AS rating2
    FROM pizzeria
             RIGHT JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
) AS foo ON foo.name2 = pizzeria.name
WHERE foo.name2 IS NULL