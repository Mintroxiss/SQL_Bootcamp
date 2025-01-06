/* Найдите одинаковые названия пиццы с одинаковой ценой, но из разных пиццерий. Убедитесь, что результат
   упорядочен по названию пиццы. Образец данных показан ниже. Убедитесь, что названия ваших столбцов 
   совпадают с названиями столбцов ниже. */

WITH combo AS (SELECT m.pizza_name,
                      m.price,
                      pizz.name,
                      pizz.id
               FROM menu m
               JOIN pizzeria pizz ON pizz.id = m.pizzeria_id)
SELECT c_1.pizza_name,
       c_1.name pizzeria_name_1,
       c_2.name pizzeria_name_2,
       c_1.price
FROM combo c_1
CROSS JOIN combo c_2
WHERE c_1.price = c_2.price
  AND c_1.pizza_name = c_2.pizza_name
  AND c_1.id > c_2.id
ORDER BY pizza_name

