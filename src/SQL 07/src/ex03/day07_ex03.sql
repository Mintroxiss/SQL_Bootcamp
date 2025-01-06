/* Напишите SQL-запрос, чтобы увидеть, как рестораны группируются по посещениям и заказам и объединяются 
   по названию ресторана.
   Вы можете использовать внутренний SQL из упражнения 02 (Рестораны по посещениям и по заказам) без 
   ограничений на количество строк.
   Кроме того, добавьте следующие правила:
   - Вычислите сумму заказов и посещений для соответствующей пиццерии (обратите внимание, что не все ключи 
     пиццерий представлены в обеих таблицах).
   - Отсортируйте результаты по столбцу total_count в порядке убывания и по столбцу name в порядке возрастания.
   - Посмотрите на пример данных ниже. */

WITH orders AS (
  SELECT pizz.name,
         COUNT(*) AS count,
         'order' AS action_type
  FROM person_order perord
  JOIN menu m ON m.id = perord.menu_id
  JOIN pizzeria pizz ON pizz.id = m.pizzeria_id
  GROUP BY name
),
     visits AS (
  SELECT pizz.name,
         COUNT(*) AS count,
         'visit' AS action_type
  FROM person_visits pv
  JOIN pizzeria pizz ON pizz.id = pv.pizzeria_id
  GROUP BY name
)

SELECT vis.name,
       COALESCE(ord.count, 0) + COALESCE(vis.count, 0) AS total_count
FROM visits vis
FULL JOIN orders ord ON ord.name = vis.name
ORDER BY total_count DESC,
         name
