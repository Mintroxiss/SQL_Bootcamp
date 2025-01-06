/* Прежде чем приступить к работе, напишите SQL-запрос, который возвращает пиццы и соответствующие названия 
   пиццерий. Смотрите пример результата ниже (сортировка не требуется).
   Примером доказательства является вывод команды EXPLAIN ANALYZE. */

SET enable_seqscan TO OFF;
EXPLAIN ANALYZE
SELECT m.pizza_name,
       pizz.name AS pizzeria_name
FROM menu m
JOIN pizzeria pizz  ON pizz.id = m.pizzeria_id
