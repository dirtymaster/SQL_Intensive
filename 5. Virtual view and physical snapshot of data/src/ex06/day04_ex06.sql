CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT name
FROM (
         SELECT pizzeria.name, menu.price
         FROM pizzeria
                  JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
                  JOIN menu ON pizzeria.id = menu.pizzeria_id
                  JOIN person ON person_visits.person_id = person.id
         WHERE person_visits.visit_date = '2022-01-08'
           AND person.name = 'Dmitriy'
     ) AS foo
WHERE foo.price < 800
