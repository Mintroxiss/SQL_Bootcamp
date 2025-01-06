/* Давайте вернемся к упражнению №03 и изменим наш SQL-оператор, чтобы возвращать имена людей вместо их 
    идентификаторов, и изменим порядок по дате действия по возрастанию, 
    а затем по имени_человека по убыванию. Взгляните на пример данных ниже. */

WITH ex03 AS (SELECT order_date AS action_date, person_id
              FROM person_order
              INTERSECT
              SELECT visit_date, person_id
              FROM person_visits)
SELECT ex.action_date, per.name AS person_name
FROM ex03 ex
JOIN person per ON ex.person_id = per.id
ORDER BY action_date, person_name DESC