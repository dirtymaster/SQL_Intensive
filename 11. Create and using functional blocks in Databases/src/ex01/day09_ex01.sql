CREATE OR REPLACE FUNCTION fnc_trg_person_update_audit() RETURNS TRIGGER AS
$$
BEGIN
    INSERT INTO person_audit
    VALUES (CURRENT_TIMESTAMP, 'U', OLD.*);
    RETURN OLD;
END;
$$ LANGUAGE PLPGSQL;

-- DROP TRIGGER trg_person_update_audit ON person;

CREATE TRIGGER trg_person_update_audit
    AFTER UPDATE
    ON person
    FOR EACH ROW
EXECUTE PROCEDURE fnc_trg_person_update_audit();

UPDATE person
SET name = 'Bulat'
WHERE id = 10;
UPDATE person
SET name = 'Damir'
WHERE id = 10;