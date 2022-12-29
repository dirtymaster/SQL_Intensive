SELECT foo.pizza_name, foo.price, pizzeria_name
FROM (
         SELECT menu.id       AS menu_id,
                menu.pizza_name,
                menu.price,
                pizzeria.name AS pizzeria_name
         FROM menu
                  JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
         EXCEPT
         SELECT menu_id,
                menu.pizza_name,
                menu.price,
                pizzeria.name AS pizzeria_name
         FROM person_order
                  JOIN menu ON menu.id = person_order.menu_id
                  JOIN pizzeria ON pizzeria.id = menu.pizzeria_id) AS foo
ORDER BY pizza_name, price