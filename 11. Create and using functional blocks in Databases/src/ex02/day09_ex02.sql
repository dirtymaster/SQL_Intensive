CREATE OR REPLACE FUNCTION fnc_trg_person_delete_audit() RETURNS TRIGGER AS
$$
BEGIN
    INSERT INTO person_audit
    VALUES (CURRENT_TIMESTAMP, 'D', OLD.*);
    RETURN OLD;
END;
$$ LANGUAGE PLPGSQL;

CREATE TRIGGER trg_person_delete_audit
    AFTER DELETE
    ON person
    FOR EACH ROW
EXECUTE PROCEDURE fnc_trg_person_delete_audit();

DELETE
FROM person
WHERE id = 10;