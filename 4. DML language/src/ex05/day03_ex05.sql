SELECT DISTINCT pizzeria.name AS pizzeria_name
FROM pizzeria
         JOIN (
    SELECT pizzeria_id
    FROM person_visits
             JOIN person ON person.id = person_visits.person_id
    WHERE person.name = 'Andrey'
    EXCEPT
    SELECT pizzeria_id
    FROM person_order
             JOIN person ON person.id = person_order.person_id
             JOIN menu ON menu.id = person_order.menu_id
    WHERE person.name = 'Andrey') AS foo ON pizzeria_id = pizzeria.id