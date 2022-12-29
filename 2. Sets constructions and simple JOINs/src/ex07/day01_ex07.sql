SELECT order_date,
       person.name || ' (age:' || person.age || ')' AS person_information
FROM person_order
         INNER JOIN person ON person_id = person.id
ORDER BY order_date, person_information