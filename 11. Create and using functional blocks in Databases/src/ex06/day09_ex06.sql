CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(IN pperson VARCHAR DEFAULT 'Dmirtiy',
                                                   IN pprice BIGINT DEFAULT 500,
                                                   IN pdate DATE DEFAULT '2022-01-08')
    RETURNS TABLE
            (
                pizzeria_name VARCHAR
            )
AS
$$
BEGIN
    RETURN QUERY SELECT DISTINCT pizzeria.name
                 FROM person
                          JOIN person_visits
                               ON person.id = person_visits.person_id
                          JOIN person_order
                               ON person.id = person_order.person_id
                          JOIN menu ON menu.id = person_order.menu_id
                          JOIN pizzeria
                               ON pizzeria.id = person_visits.pizzeria_id
                 WHERE person.name = pperson
                   AND menu.price < pprice
                   AND person_visits.visit_date = pdate
                   AND person_order.order_date = pdate;
END
$$ LANGUAGE PLPGSQL;

SELECT *
FROM fnc_person_visits_and_eats_on_date(pprice := 800);

SELECT *
FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna', pprice := 1300,
                                        pdate := '2022-01-01');