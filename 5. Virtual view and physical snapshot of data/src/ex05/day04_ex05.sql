CREATE VIEW v_price_with_discount AS
SELECT person.name,
       pizza_name,
       price,
       round(price - price * 0.1) AS discount_price
FROM person_order
         JOIN person ON person.id = person_order.person_id
         JOIN menu ON menu.id = person_order.menu_id
ORDER BY name, pizza_name
