/* Напишите SQL-запрос, который возвращает пропущенные дни с 1 по 10 января 2022 года 
   (включая все дни) для посещений людей с идентификаторами 1 или 2 (т. е. дни, пропущенные обоими).
   Пожалуйста, упорядочьте данные по дням посещения в порядке возрастания. Пример данных с 
   названиями столбцов показан ниже. */

WITH id_1_days AS (SELECT visit_date
                   FROM person_visits
                   WHERE person_id = 1),
     id_2_days AS (SELECT visit_date
                   FROM person_visits
                   WHERE person_id = 2)
SELECT missing_date::date
FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') AS missing_date
LEFT JOIN id_1_days one ON one.visit_date = missing_date
LEFT JOIN id_2_days two ON two.visit_date = missing_date
WHERE one.visit_date IS NULL
      AND two.visit_date IS NULL
ORDER BY missing_date

