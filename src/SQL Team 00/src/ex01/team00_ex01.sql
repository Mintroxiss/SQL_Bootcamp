/* Пожалуйста, добавьте к SQL из предыдущего упражнения способ отображения дополнительных строк с самыми
   дорогими затратами. Посмотрите на пример данных ниже. Пожалуйста, отсортируйте данные по total_cost, 
   а затем по поездкам. */

WITH RECURSIVE tour_generation AS (
  SELECT r1.point1,
         r1.point2,
         2 AS iter,
         r1.cost AS total_cost,
         '{a,' || r1.point2 AS tour
  FROM roads_info r1
  WHERE r1.point1 = 'a'
  UNION ALL
  SELECT r2.point1,
         r2.point2,
         tg.iter + 1,
         r2.cost + tg.total_cost AS total_cost,
         tg.tour || ',' || r2.point2 AS tour
  FROM roads_info r2 
  JOIN tour_generation tg ON tg.point2 = r2.point1
  WHERE (r2.point2 != 'a' OR tg.iter > 2)
    AND tg.tour NOT LIKE '%' || r2.point2 || '%'
),
                tour_options AS (
  SELECT tg.total_cost + r.cost AS total_cost,
         tour || ',a}' AS tour
  FROM tour_generation tg
  JOIN roads_info r ON r.point1 = tg.point2
  WHERE r.point2 = 'a' 
    AND tg.iter = 4
)

SELECT *
FROM tour_options
WHERE total_cost = (SELECT MIN(total_cost)
                    FROM tour_options)
UNION
SELECT *
FROM tour_options
WHERE total_cost = (SELECT MAX(total_cost)
                    FROM tour_options)
ORDER BY total_cost, tour
