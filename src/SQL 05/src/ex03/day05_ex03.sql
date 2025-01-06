/* Создайте лучший многоколоночный индекс B-Tree с именем idx_person_order_multi для приведенного ниже
   SQL-оператора. */

CREATE INDEX idx_person_order_multi ON person_order(person_id, menu_id);

SET enable_seqscan TO OFF;
EXPLAIN ANALYZE
SELECT person_id, menu_id,order_date
FROM person_order
WHERE person_id = 8 AND menu_id = 19