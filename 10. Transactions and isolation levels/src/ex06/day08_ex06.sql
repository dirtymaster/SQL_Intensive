-- for Session #1
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- for Session #2
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- for Session #1
select SUM(rating) from pizzeria;

-- for Session #2
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
COMMIT;

-- for Session #1
select SUM(rating) from pizzeria;
COMMIT;
select SUM(rating) from pizzeria;

-- for Session #2
select SUM(rating) from pizzeria;
