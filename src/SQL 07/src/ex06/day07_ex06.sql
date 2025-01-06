/* Напишите SQL-запрос, который возвращает количество заказов, среднюю цену, максимальную цену и минимальную
   цену на пиццу, проданную в каждом ресторане-пиццерии. Результат должен быть отсортирован по 
   названию пиццерии. Смотрите пример данных ниже. Округлите среднюю цену до 2 плавающих чисел. */

SELECT pizz.name,
       COUNT(*) AS count_of_orders,
       ROUND(AVG(m.price), 2) AS average_price,
       MAX(m.price) AS max_price,
       MIN(m.price) AS min_price
FROM person_order perord
JOIN menu m ON m.id = perord.menu_id
JOIN pizzeria pizz ON pizz.id = m.pizzeria_id
GROUP BY pizz.name
ORDER BY name

