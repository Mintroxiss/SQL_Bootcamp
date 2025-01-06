/* Напишите SQL-оператор, который возвращает разницу (минус) значений столбца 
    person_id при сохранении дубликатов между таблицей person_order и таблицей person_visits
    для дат order_date и visit_date за 7 января 2022 года. */

SELECT person_id
FROM person_order
WHERE order_date = '07.01.2022'
EXCEPT ALL
SELECT person_id
FROM person_visits
WHERE visit_date = '07.01.2022'