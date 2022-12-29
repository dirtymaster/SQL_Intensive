SELECT id AS object_id, name as object_name
FROM person
UNION
SELECT id AS object_id, pizza_name AS object_name
FROM menu
ORDER BY 1, 2