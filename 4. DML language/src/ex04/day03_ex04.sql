WITH male AS (SELECT pizzeria_id
              FROM person_order
                       JOIN person ON person.id = person_order.person_id
                       JOIN menu ON person_order.menu_id = menu.id
              WHERE person.gender = 'male'),
     female AS (SELECT pizzeria_id
                FROM person_order
                         JOIN person
                              ON person.id = person_order.person_id
                         JOIN menu ON person_order.menu_id = menu.id
                WHERE person.gender = 'female')
SELECT name AS pizzeria_name
FROM (SELECT *
      FROM (
               SELECT *
               FROM male
               EXCEPT
               SELECT *
               FROM female) AS foo
      UNION
      SELECT *
      FROM (
               SELECT *
               FROM female
               EXCEPT
               SELECT *
               FROM male) AS bar) AS spam
         JOIN pizzeria ON pizzeria_id = pizzeria.id
ORDER BY name