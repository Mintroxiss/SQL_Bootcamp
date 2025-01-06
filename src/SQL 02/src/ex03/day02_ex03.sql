/* Давайте вернемся к упражнению #01, перепишите ваш SQL, используя шаблон CTE 
   (Common Table Expression). Пожалуйста, перейдите к части CTE вашего "генератора дней".
   Результат должен выглядеть так же, как в упражнении #01. */

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
