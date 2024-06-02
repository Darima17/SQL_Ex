COMMENT ON TABLE person_discounts IS 'Эта таблица хранит информацию о скидках для отдельных лиц в пиццериях.';
COMMENT ON COLUMN person_discounts.person_id IS 'Идентификатор лица, связанного со скидкой.';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Идентификатор пиццерии, связанной со скидкой.';
COMMENT ON COLUMN person_discounts.discount IS 'Процентная скидка, применимая к лицу в пиццерии.';