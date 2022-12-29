SELECT person.id AS person_id, COUNT(person_visits.id) AS count_of_visits
FROM person_visits
         JOIN person ON person.id = person_visits.person_id
GROUP BY person.id
ORDER BY count_of_visits DESC, person_id