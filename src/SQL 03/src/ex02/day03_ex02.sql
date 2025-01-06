/* Используйте оператор SQL из упражнения #01 и выведите названия пицц из пиццерии, которые никто не
   заказывал, включая соответствующие цены. Результат должен быть отсортирован по названию и
   цене пиццы. Пример выходных данных показан ниже. */

WITH miss_id AS (SELECT id AS menu_id
                 FROM menu
                 EXCEPT
                 SELECT menu_id
                 FROM person_order)
SELECT m.pizza_name,
       m.price,
       piz.name
FROM menu m
JOIN pizzeria piz ON piz.id = m.pizzeria_id	
WHERE m.id IN (SELECT menu_id
               FROM miss_id)
ORDER BY pizza_name,
         price
