-- for Session #1
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- for Session #2
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- for Session #1
select SUM(rating) from pizzeria;

-- for Session #2
UPDATE pizzeria SET rating = 1 WHERE name = 'Pizza Hut';
COMMIT;

-- for Session #1
select SUM(rating) from pizzeria;
COMMIT;
select SUM(rating) from pizzeria;

-- for Session #2
select SUM(rating) from pizzeria;
