-- DROP FUNCTION fnc_fibonacci;
CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10)
    RETURNS TABLE
            (
                number INTEGER
            )
AS
$$
BEGIN
    IF pstop <= 0 THEN
        RETURN QUERY (SELECT -1);
    ELSE
        RETURN QUERY (
            SELECT 0
            UNION ALL
            (
                WITH RECURSIVE recursion AS (
                    SELECT 0::INTEGER AS first,
                           1::INTEGER AS second,
                           2::INTEGER AS iteration
                    UNION
                    SELECT second, first + second, iteration + 1
                    FROM recursion
                    WHERE second < pstop
                )
                SELECT second
                FROM recursion
                WHERE second < pstop)
            ORDER BY 1);
    END IF;
END
$$ LANGUAGE PLPGSQL;

SELECT *
FROM fnc_fibonacci(100);
SELECT *
FROM fnc_fibonacci();