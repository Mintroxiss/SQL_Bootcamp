/* Найдите объединение пиццерий, в которых есть заказы либо от женщин, либо от мужчин. Другими словами,
   вы должны найти набор названий пиццерий, которые заказывали только женщины, и выполнить операцию 
   «UNION» с набором названий пиццерий, которые заказывали только мужчины. Пожалуйста, будьте
   осторожны со словом «только» для обоих полов. Пожалуйста, отсортируйте результат 
   по названию пиццерии. Пример данных показан ниже.  */

WITH peoples AS (SELECT pizz.name pizzeria_name, p.gender
                 FROM person_order por
                 JOIN person p ON p.id = por.person_id
                 JOIN menu m ON m.id = por.menu_id
                 JOIN pizzeria pizz ON pizz.id = m.pizzeria_id)
SELECT pizzeria_name
FROM peoples
WHERE gender = 'female'
EXCEPT
SELECT pizzeria_name
FROM peoples
WHERE gender = 'male'