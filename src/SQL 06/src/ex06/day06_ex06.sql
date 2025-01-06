/* Давайте создадим последовательность базы данных с именем seq_person_discounts (начиная со значения 1) и 
   установим значение по умолчанию для атрибута id таблицы person_discounts, чтобы каждый раз автоматически
   брать значение из seq_person_discounts.
   Обратите внимание, что ваш следующий номер последовательности равен 1, в этом случае задайте 
   фактическое значение последовательности базы данных по формуле «количество строк в таблице 
   person_discounts» + 1. В противном случае вы получите ошибки о нарушении ограничения Primary Key. */

CREATE SEQUENCE seq_person_discounts AS bigint OWNED BY person_discounts.id;
ALTER TABLE person_discounts
ALTER COLUMN id SET DEFAULT nextval('seq_person_discounts');
SELECT setval('seq_person_discounts', COALESCE((SELECT MAX(id) + 1 FROM person_discounts), 1));

-- INSERT into person_discounts(person_id, pizzeria_id, discount)
-- VALUES (2,3,21);

-- SELECT * FROM person_discounts;

-- DELETE FROM person_discounts
-- WHERE person_id = 2 AND pizzeria_id = 3;