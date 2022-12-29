CREATE VIEW v_symmetric_union AS
SELECT *
FROM (
         WITH R AS (SELECT person_id
                    FROM person_visits
                    WHERE visit_date = '2022-01-02'),
              S AS (SELECT person_id
                    FROM person_visits
                    WHERE visit_date = '2022-01-06')
         SELECT *
         FROM (SELECT * FROM R EXCEPT SELECT * FROM S) AS foo
         UNION
         SELECT *
         FROM (SELECT * FROM S EXCEPT SELECT * FROM R) AS bar
         ORDER BY person_id) AS spam
