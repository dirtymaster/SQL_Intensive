SELECT CASE
           WHEN person.name IS NULL THEN '-'
           ELSE person.name
           END AS person_name,
       CASE
           WHEN foo.visit_date IS NULL THEN NULL
           ELSE foo.visit_date
           END AS visit_date,
       CASE
           WHEN pizzeria.name IS NULL THEN '-'
           ELSE pizzeria.name
           END AS pizzeria_name
FROM person
         FULL JOIN (
    SELECT *
    FROM person_visits
    WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03'
) AS foo ON person.id = foo.person_id
         FULL JOIN pizzeria ON pizzeria.id = foo.pizzeria_id
ORDER BY 1, 2, 3