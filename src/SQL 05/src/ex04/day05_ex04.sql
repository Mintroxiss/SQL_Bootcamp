/* Создайте уникальный индекс BTree с именем idx_menu_unique в таблице menu для столбцов pizzeria_id
   и pizza_name. Напишите и предоставьте любой SQL с доказательством (EXPLAIN ANALYZE) того, что
   индекс idx_menu_unique работает. */

CREATE UNIQUE INDEX idx_menu_unique ON menu(pizzeria_id, pizza_name);

SET enable_seqscan TO OFF;
EXPLAIN ANALYZE
SELECT *
FROM menu
WHERE pizzeria_id = 3
   OR pizza_name = 'pepperoni pizza'
ORDER BY pizza_name, pizzeria_id