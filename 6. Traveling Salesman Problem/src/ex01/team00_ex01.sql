CREATE TABLE nodes
(
    point1 char,
    point2 char,
    cost   bigint
);

INSERT INTO nodes
VALUES ('a', 'b', 10),
       ('a', 'c', 15),
       ('a', 'd', 20),
       ('b', 'a', 10),
       ('b', 'c', 35),
       ('b', 'd', 25),
       ('c', 'a', 15),
       ('c', 'b', 35),
       ('c', 'd', 30),
       ('d', 'a', 20),
       ('d', 'b', 25),
       ('d', 'c', 30);

CREATE OR REPLACE FUNCTION number_of_nodes() RETURNS BIGINT AS
$$
SELECT COUNT((SELECT point1 WHERE point1 = (SELECT MIN(point1) FROM nodes))) + 1
FROM nodes
$$ LANGUAGE SQL;

CREATE OR REPLACE FUNCTION contains(letter CHAR, tour VARCHAR) RETURNS BOOL AS
$$
SELECT CASE
           WHEN tour LIKE '%' || letter || '%' THEN true
           ELSE false
           END AS foo
$$ LANGUAGE SQL;

WITH algorithm AS (
    WITH RECURSIVE recursion AS (
        SELECT 0::BIGINT     AS total_cost,
               'a,'::VARCHAR AS tour,
               'a'::CHAR     AS letter,
               1::BIGINT     AS iteration
        UNION
        SELECT recursion.total_cost + nodes.cost,
               recursion.tour || nodes.point2 || ',',
               nodes.point2,
               recursion.iteration + 1
        FROM recursion,
             nodes
        WHERE nodes.point1 = recursion.letter
          AND NOT contains(nodes.point2, recursion.tour)
          AND recursion.iteration <= number_of_nodes())
    SELECT total_cost +
           (SELECT cost
            FROM nodes
            WHERE point1 = letter
              AND point2 = 'a') AS total_cost,
           '{' || tour || 'a}'  AS tour
    FROM recursion
    WHERE iteration = number_of_nodes()
)
SELECT total_cost, tour
FROM algorithm
WHERE total_cost IN (SELECT MIN(total_cost) FROM algorithm)
UNION
SELECT total_cost, tour
FROM algorithm
WHERE total_cost IN (SELECT MAX(total_cost) FROM algorithm)
ORDER BY total_cost, tour