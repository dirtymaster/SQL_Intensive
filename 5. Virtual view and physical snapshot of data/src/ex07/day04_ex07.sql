INSERT INTO person_visits
VALUES ((SELECT MAX(id) + 1 AS id FROM person_visits),
        (SELECT id AS person_id FROM person WHERE name = 'Dmitriy'),
        (SELECT pizzeria.id AS pizzeria_id
         FROM pizzeria
                  JOIN menu ON pizzeria.id = menu.pizzeria_id
         WHERE name <> (SELECT * FROM mv_dmitriy_visits_and_eats)
           AND price < 800
         LIMIT 1),
        '2022-01-08'::DATE);

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;
