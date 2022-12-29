insert into currency
values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency
values (100, 'EUR', 0.79, '2022-01-08 13:29');

CREATE OR REPLACE FUNCTION fnc_find_nearest_date(current timestamp, currussy varchar)
    RETURNS timestamp
    LANGUAGE SQL
AS
$$
SELECT coalesce(
               (SELECT updated
                FROM (SELECT updated, min(current - updated) AS m
                      FROM currency
                      WHERE updated < current AND name = currussy
                      GROUP BY updated
                      ORDER BY m
                      LIMIT 1) AS kek),
               (SELECT updated
                FROM (SELECT updated, min(updated - current) AS m
                      FROM currency
                      WHERE updated >= current
                        AND name = currussy
                      GROUP BY updated
                      ORDER BY m
                      LIMIT 1) AS kek)
           );
$$;

SELECT DISTINCT coalesce("user".name, 'not defined')    AS name,
       coalesce("user".lastname, 'not defined')         AS last_name,
       c.name                                           AS currency_name,
       money * c.rate_to_usd                            AS currency_in_usd
FROM "user"
         RIGHT JOIN balance b on "user".id = b.user_id
         JOIN currency c on b.currency_id = c.id
WHERE c.updated = fnc_find_nearest_date(b.updated, c.name)
ORDER BY 1 DESC, 2, 3;