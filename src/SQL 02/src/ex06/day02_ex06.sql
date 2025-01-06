/* Найдите все названия пиццы (и соответствующие названия пиццерий, используя таблицу меню),
   заказанные Денисом или Анной. Отсортируйте результат по обоим столбцам.
   Пример вывода показан ниже. */

SELECT DISTINCT m.pizza_name,
                pizz.name AS pizzeria_name
FROM person_order pers
JOIN menu m ON m.id = pers.menu_id
JOIN pizzeria pizz ON pizz.id = m.pizzeria_id
WHERE person_id IN (SELECT id
                    FROM person
                    WHERE name = 'Anna'
                      OR name = 'Denis')
ORDER BY pizza_name,
         pizzeria_name

