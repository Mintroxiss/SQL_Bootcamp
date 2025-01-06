/* Напишите SQL-оператор, который возвращает уникальные названия пиццы из таблицы меню и 
    сортирует их по столбцу pizza_name в порядке убывания. Обратите внимание на раздел "Отказано". */

SELECT pizza_name
FROM menu a
WHERE NOT EXISTS (SELECT true
                  FROM menu b
                  WHERE a.pizza_name = b.pizza_name
                    AND a.id < b.id)
ORDER BY pizza_name DESC;
