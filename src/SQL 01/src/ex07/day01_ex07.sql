/* Напишите SQL-оператор, который возвращает дату заказа из таблицы person_order и соответствующее 
    имя человека (имя и возраст отформатированы, как в примере данных ниже), сделавшего заказ,
    из таблицы person. Добавьте сортировку по обоим столбцам в порядке возрастания. */

SELECT perord.order_date, per.name || ' (age:' || per.age || ')' AS person_information
FROM person_order perord
JOIN person per ON per.id = perord.person_id
ORDER BY order_date, person_information