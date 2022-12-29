SELECT DISTINCT spam.foo_name AS name, spam.total_count AS count_of_visits
FROM (
         WITH bar AS (
             SELECT person.name AS bar_name,
                    CASE
                        WHEN COUNT(person_visits.id) > 3
                            THEN COUNT(person_visits.id)
                        END     AS total_count
             FROM person_visits
                      JOIN person ON person.id = person_visits.person_id
             GROUP BY person.name)
         SELECT bar.bar_name AS foo_name, bar.total_count
         FROM bar AS foo
                  JOIN
              bar ON bar.total_count IS NOT NULL) AS spam