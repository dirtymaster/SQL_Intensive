WITH dates_generator AS (
    SELECT *
    FROM generate_series('2022-01-01'::timestamp, '2022-01-10'::timestamp,
                         '1 day'::interval) AS missing_date
)

SELECT to_char(missing_date, 'YYYY-MM-DD') AS missing_date
FROM (SELECT missing_date
      FROM dates_generator
               LEFT OUTER JOIN (
          SELECT visit_date AS dates
          FROM person_visits
          WHERE person_id = 1
             OR person_id = 2
      ) AS foo ON foo.dates = missing_date
      WHERE foo.dates is NULL) AS bar