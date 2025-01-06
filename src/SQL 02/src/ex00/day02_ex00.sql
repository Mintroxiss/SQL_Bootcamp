/* Напишите SQL-оператор, который возвращает список пиццерий с соответствующим значением рейтинга,
   которые не были посещены людьми. */

SELECT piz.name, piz.rating
FROM pizzeria piz
LEFT JOIN person_visits pv ON piz.id = pv.pizzeria_id
WHERE pv.pizzeria_id IS NULL
