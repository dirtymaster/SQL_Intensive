SELECT *,
       CASE
           WHEN formula > average THEN true
           ELSE false
           END AS comparison
FROM (
         SELECT address,
                ROUND(CAST(MAX(age)::FLOAT - (MIN(age) / MAX(age)::FLOAT) AS numeric), 2) AS formula,
                ROUND(AVG(age), 2)                         AS average
         FROM person
         GROUP BY address) AS foo
ORDER BY address