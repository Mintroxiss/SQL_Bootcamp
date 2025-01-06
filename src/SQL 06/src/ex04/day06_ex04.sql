/* Пожалуйста, добавьте следующие правила ограничений для существующих столбцов таблицы person_discounts:
   - столбец person_id не должен быть NULL (используйте ограничение ch_nn_person_id);
   - столбец pizzeria_id не должен быть NULL (используйте ограничение ch_nn_pizzeria_id);
   - столбец discount не должен быть NULL (используйте ограничение ch_nn_discount);
   - cтолбец скидки должен быть равен 0 процентов по умолчанию;
   - столбец скидки должен быть в диапазоне значений от 0 до 100 (используйте ограничение ch_range_discount). */

ALTER TABLE person_discounts
    ALTER COLUMN person_id SET NOT NULL,
    ALTER COLUMN pizzeria_id SET NOT NULL,
    ALTER COLUMN discount SET NOT NULL,
   
    ALTER COLUMN discount SET DEFAULT 0,

    ADD CONSTRAINT ch_nn_person_id CHECK (person_id IS NOT NULL),
    ADD CONSTRAINT ch_nn_pizzeria_id CHECK (pizzeria_id IS NOT NULL),
    ADD CONSTRAINT ch_nn_discount CHECK (discount IS NOT NULL),
    ADD CONSTRAINT ch_range_discount CHECK (discount BETWEEN 0 AND 100);

