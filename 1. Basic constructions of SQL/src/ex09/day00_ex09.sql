SELECT
    (SELECT name FROM person WHERE pv.person_id = person.id) AS person_name,
	(SELECT name FROM pizzeria WHERE pv.pizzeria_id = pizzeria.id) AS pizzeria_name
FROM person_visits AS pv
WHERE visit_date BETWEEN '2022-01-07' AND '2022-01-09'
ORDER BY person_name ASC, pizzeria_name DESC