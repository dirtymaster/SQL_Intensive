-- for Session #1
BEGIN TRANSACTION;

-- for Session #2
BEGIN TRANSACTION;

-- for Session #1
UPDATE pizzeria SET rating = 1 WHERE id = 1;

-- for Session #2
UPDATE pizzeria SET rating = 2 WHERE id = 2;

-- for Session #1
UPDATE pizzeria SET rating = 2 WHERE id = 2;

-- for Session #2
UPDATE pizzeria SET rating = 1 WHERE id = 1;

-- for Session #1
COMMIT;

-- for Session #2
COMMIT;
