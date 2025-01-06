/* Напишите SQL-оператор, который возвращает идентификатор меню и названия пиццы из 
    таблицы menu и идентификатор персоны и имя персоны из таблицы person 
    в один глобальный список (с именами столбцов, как показано в примере ниже), 
    упорядоченный по столбцам object_id, а затем по столбцам object_name. */

SELECT id AS object_id, pizza_name AS object_name
FROM menu
UNION
SELECT id, name
FROM person
ORDER BY object_id, object_name
