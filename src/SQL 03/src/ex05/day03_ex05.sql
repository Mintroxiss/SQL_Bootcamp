/* Напишите SQL-оператор, который возвращает список пиццерий, которые посетил Андрей, но не сделал в них
   заказ. Сортируйте по названию пиццерии. Пример данных показан ниже. */

SELECT DISTINCT pizz.name pizzeria_name
FROM person_visits pv
JOIN pizzeria pizz ON pizz.id = pv.pizzeria_id
FULL JOIN person_order por ON por.order_date = pv.visit_date
WHERE por.order_date IS NULL
  AND pv.person_id = (SELECT id
                      FROM person 
                      WHERE name = 'Andrey')
ORDER BY pizzeria_name