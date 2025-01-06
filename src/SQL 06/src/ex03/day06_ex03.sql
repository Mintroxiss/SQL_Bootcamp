/* На самом деле, нам нужно улучшить согласованность данных с одной стороны и повысить производительность с
   другой. Пожалуйста, создайте многоколоночный уникальный индекс (с именем idx_person_discounts_unique),
   который предотвращает дублирование пар идентификаторов персоны и пиццерии.
   После создания нового индекса предоставьте любой простой SQL-оператор, показывающий использование индекса
   (с помощью EXPLAIN ANALYZE). */

CREATE UNIQUE INDEX idx_person_discounts_unique ON person_discounts(person_id, pizzeria_id);

SET enable_seqscan TO OFF;
EXPLAIN ANALYZE
SELECT
      person_id,
      pizzeria_id
  FROM
      person_discounts;

-- INSERT INTO person_discounts (id, person_id, pizzeria_id, discount)
-- VALUES (16, 9, 6, 22)