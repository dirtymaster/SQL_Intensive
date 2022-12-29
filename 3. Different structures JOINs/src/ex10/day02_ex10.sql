SELECT foo.name    AS person_name1,
       bar.name    AS person_name2,
       foo.address AS common_address
FROM (SELECT DISTINCT name, address FROM person) AS foo,
     (SELECT DISTINCT name, address FROM person) AS bar
WHERE foo.address = bar.address
  AND foo.name
    < bar.name
ORDER BY 1, 2, 3