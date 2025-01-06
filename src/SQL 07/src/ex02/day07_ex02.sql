/* Напишите, пожалуйста, SQL-запрос, чтобы увидеть 3 любимых ресторана по посещениям и заказам в списке 
   (пожалуйста, добавьте столбец action_type со значениями 'order' или 'visit', это зависит от данных 
   из соответствующей таблицы). Пожалуйста, посмотрите на пример данных ниже. Результат должен быть 
   отсортирован в порядке возрастания по столбцу action_type и в порядке убывания по столбцу count. */

WITH order_rating AS (
  SELECT pizz.name,
         COUNT(*) AS count,
         'order' AS action_type
  FROM person_order perord
  JOIN menu m ON m.id = perord.menu_id
  JOIN pizzeria pizz ON pizz.id = m.pizzeria_id
  GROUP BY name
  ORDER BY count DESC
  LIMIT 3
),
     visit_rating AS (
  SELECT pizz.name,
         COUNT(*) AS count,
         'visit' AS action_type
  FROM person_visits pv
  JOIN pizzeria pizz ON pizz.id = pv.pizzeria_id
  GROUP BY name
  ORDER BY count DESC
  LIMIT 3
)

SELECT *
FROM order_rating
UNION ALL
SELECT * 
FROM visit_rating
ORDER BY action_type, count DESC

