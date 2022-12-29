SELECT *, volume * last_rate_to_usd AS total_volume_in_usd
FROM (SELECT COALESCE((SELECT name FROM "user" WHERE id = foo.user_id),
                      'not defined') AS name,
             COALESCE((SELECT lastname FROM "user" WHERE id = foo.user_id),
                      'not defined') AS lastname,
             type,
             SUM(money)              AS volume,
             COALESCE((SELECT DISTINCT name
                       FROM currency
                       WHERE id = foo.currency_id),
                      'not defined')
                                     AS currency_name,
             COALESCE((SELECT rate_to_usd
                       FROM currency
                       WHERE id = foo.currency_id
                       ORDER BY currency.updated DESC
                       LIMIT 1), 1)  AS last_rate_to_usd
      FROM (
               SELECT DISTINCT user_id, type, currency_id, money
               FROM balance
               GROUP BY user_id, currency_id, type, money) AS foo
      GROUP BY 1, 2, 3, foo.currency_id) AS spam
ORDER BY 1 DESC, 2, 3