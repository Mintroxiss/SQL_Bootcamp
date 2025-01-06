/* Создайте новый индекс BTree с именем idx_1, который должен улучшить метрику «Время выполнения» этого SQL.
   Предоставьте доказательства (EXPLAIN ANALYZE) того, что SQL был улучшен. */

CREATE INDEX idx_1 ON pizzeria(rating);
-- DROP INDEX idx_1;

SET enable_seqscan TO OFF;
EXPLAIN ANALYSE
SELECT
    m.pizza_name AS pizza_name,
    max(rating) OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k
FROM  menu m
INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY 1,2;
