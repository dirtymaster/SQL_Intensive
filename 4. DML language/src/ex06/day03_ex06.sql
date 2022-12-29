SELECT DISTINCT foo.pizza_name,
                foo.name AS pizzeria_name_1,
                bar.name AS pizzeria_name_2,
                foo.price
FROM (
         SELECT pizzeria.name, pizza_name, price
         FROM menu
                  JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
     ) AS foo,
     (SELECT pizzeria.name, pizza_name, price
      from menu
               JOIN pizzeria ON menu.pizzeria_id = pizzeria.id) AS bar
WHERE foo.name < bar.name
  AND foo.price = bar.price
ORDER BY pizza_name