COMMENT ON TABLE person_discounts IS
    'A table with discounts for each person. Таблица со скидками для каждого человека.';
COMMENT ON COLUMN person_discounts.id IS 'discount id. id скидки';
COMMENT ON COLUMN person_discounts.person_id IS 'person id. id человека';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'pizzeria id. id пиццерии';
COMMENT ON COLUMN person_discounts.discount
    IS 'the discount amount as a percentage. размер скидки в процентах';