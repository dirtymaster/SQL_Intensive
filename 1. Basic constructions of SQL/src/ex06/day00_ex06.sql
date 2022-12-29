SELECT
	(SELECT name FROM person
	 WHERE person_order.person_id = person.id) AS name,
	 CASE WHEN (SELECT name FROM person
				WHERE person_order.person_id = person.id)
				= 'Denis' THEN 'true'
	 	ELSE 'false'
	END AS check_name
FROM person_order
WHERE order_date = '2022-01-07' AND
	(menu_id = 13 OR menu_id = 14 OR menu_id = 18)