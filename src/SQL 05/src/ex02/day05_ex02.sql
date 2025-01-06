/* Создайте функциональный индекс B-Tree с именем idx_person_name на столбце name таблицы person. Индекс 
   должен содержать имена людей в верхнем регистре.
   Напишите и предоставьте любой SQL с доказательством (EXPLAIN ANALYZE) того, что индекс idx_person_name
   работает. */

CREATE INDEX idx_person_name ON person(UPPER(name));

SET enable_seqscan TO OFF;
EXPLAIN ANALYSE
SELECT *
FROM person
WHERE UPPER(name) = 'DENIS'