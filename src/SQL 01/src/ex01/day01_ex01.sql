/* Измените SQL-оператор из "Упражнения 00", удалив столбец object_id. 
    Затем измените порядок по object_name для части данных из таблицы person, 
    а затем из таблицы menu (как показано в примере ниже). Пожалуйста, сохраните дубликаты! */

WITH combined_data AS (SELECT name AS object_name, 1 AS sort_order
                       FROM person
	               UNION ALL
	               SELECT pizza_name, 2 AS sort_order
                       FROM menu)
SELECT object_name
FROM combined_data
ORDER BY sort_order, object_name
