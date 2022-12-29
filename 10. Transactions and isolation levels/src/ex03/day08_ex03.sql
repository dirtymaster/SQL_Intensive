-- for Session #1
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- for Session #2
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- for Session #1
select rating from pizzeria where name  = 'Pizza Hut';

-- for Session #2
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
COMMIT;

-- for Session #1
select rating from pizzeria where name  = 'Pizza Hut';
COMMIT;
select rating from pizzeria where name  = 'Pizza Hut';

-- for Session #2
select rating from pizzeria where name  = 'Pizza Hut';