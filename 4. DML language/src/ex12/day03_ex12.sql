INSERT INTO person_order
SELECT id, person_id, menu_id, order_date
FROM (
         SELECT DISTINCT generate_series((SELECT MAX(id) FROM person_order) + 1,
                                         (SELECT MAX(id) FROM person_order) +
                                         (SELECT COUNT(id) FROM person),
                                         1) AS id,
                         generate_series(1,
                                         (SELECT MAX(id) FROM person),
                                         1) AS person_id,
                         menu.id            AS menu_id,
                         '2022-02-25'::date AS order_date
         FROM person_order,
              person,
              menu
         WHERE menu.pizza_name = 'greek pizza'
         ORDER BY id, person_id, menu_id
     ) AS foo;