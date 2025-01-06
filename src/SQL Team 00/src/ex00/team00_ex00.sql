/* Создайте таблицу с именованными узлами, используя структуру {point1, point2, cost}, и заполните ее данными 
   на основе картинки (помните, что между двумя узлами есть прямой и обратный пути).
   Напишите SQL-оператор, который возвращает все туры (они же пути) с минимальной стоимостью поездки, если мы 
   начинаем из города «a».
   Помните, что вам нужно найти самый дешевый способ посетить все города и вернуться в начальную точку. 
   Например, тур выглядит как a -> b -> c -> d -> a.
   Пожалуйста, отсортируйте данные по total_cost, а затем по турам. */

-- CREATE TABLE roads_info (
--     point1 char(1) CHECK(point1 != ' '), 
-- 	point2 char(1) CHECK(point2 != ' '),
-- 	cost integer CHECK(cost > 0),
-- 	CHECK(point1 != point2),
-- 	PRIMARY KEY(point1, point2)
-- );

-- INSERT INTO roads_info VALUES('a','b', 10);
-- INSERT INTO roads_info VALUES('a','c', 15);
-- INSERT INTO roads_info VALUES('a','d', 20);
-- INSERT INTO roads_info VALUES('b','a', 10);
-- INSERT INTO roads_info VALUES('b','c', 35);
-- INSERT INTO roads_info VALUES('b','d', 25);
-- INSERT INTO roads_info VALUES('c','a', 15);
-- INSERT INTO roads_info VALUES('c','b', 35);
-- INSERT INTO roads_info VALUES('c','d', 30);
-- INSERT INTO roads_info VALUES('d','a', 20);
-- INSERT INTO roads_info VALUES('d','b', 25);
-- INSERT INTO roads_info VALUES('d','c', 30);

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
ORDER BY total_cost, tour
