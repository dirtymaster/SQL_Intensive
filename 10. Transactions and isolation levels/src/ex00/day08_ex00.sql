-- for Session #1
BEGIN TRANSACTION;
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
select * from pizzeria where name  = 'Pizza Hut';

-- for Session #2
BEGIN TRANSACTION;
select * from pizzeria where name  = 'Pizza Hut';

-- for Session #1
COMMIT;

-- for Session #2
select * from pizzeria where name  = 'Pizza Hut';