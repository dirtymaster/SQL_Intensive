SELECT person.name,
       pizza_name,
       price,
       price - (price / 100 * discount) AS discount_price,
       pizzeria.name                    AS pizzeria_name
FROM person_order
         JOIN menu ON menu.id = person_order.menu_id
         JOIN person ON person.id = person_order.person_id
         JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
         JOIN person_discounts ON person.id = person_discounts.person_id
WHERE pizzeria.id = person_discounts.pizzeria_id
ORDER BY person.name, pizza_name