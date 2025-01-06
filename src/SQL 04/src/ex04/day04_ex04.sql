/* Напишите SQL-оператор, удовлетворяющий формуле (R - S)∪(S - R) .
   Где R - таблица person_visits с фильтром по 2 января 2022 года, S - также таблица person_visits, но с
   другим фильтром по 6 января 2022 года. Выполните вычисления с наборами по столбцу person_id, и этот 
   столбец будет один в результате. Отсортируйте результат по столбцу person_id и представьте ваш 
   окончательный SQL в представлении базы данных v_symmetric_union */

CREATE VIEW v_symmetric_union AS (WITH R AS (SELECT person_id
                                             FROM person_visits
                                             WHERE visit_date = '2022-01-02'),
                                       S AS (SELECT person_id
                                             FROM person_visits
                                             WHERE visit_date = '2022-01-06')
                                 (SELECT *
                                  FROM R
                                  EXCEPT
                                  SELECT * FROM S)
                                 UNION
                                 (SELECT *
                                  FROM S
                                  EXCEPT
                                  SELECT * FROM R)
                                 ORDER BY person_id)

