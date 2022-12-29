SELECT person.address,
       pizzeria.name,
       COUNT(person_order.id) AS count_of_orders
FROM person_order
         JOIN menu ON menu.id = person_order.menu_id
         JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
         JOIN person ON person.id = person_order.person_id
GROUP BY pizzeria.name, person.address
ORDER BY address, name