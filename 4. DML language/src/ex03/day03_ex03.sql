WITH male AS (SELECT pizzeria_id
              FROM person_visits
                       JOIN person ON person.id = person_visits.person_id
              WHERE person.gender = 'male'),
     female AS (SELECT pizzeria_id
                FROM person_visits
                         JOIN person
                              ON person.id = person_visits.person_id
                WHERE person.gender = 'female')
SELECT name AS pizzeria_name
FROM (SELECT *
      FROM (
               SELECT *
               FROM male
               EXCEPT ALL
               SELECT *
               FROM female) AS foo
      UNION ALL
      SELECT *
      FROM (
               SELECT *
               FROM female
               EXCEPT ALL
               SELECT *
               FROM male) AS bar) AS spam
         JOIN pizzeria ON pizzeria_id = pizzeria.id
ORDER BY name