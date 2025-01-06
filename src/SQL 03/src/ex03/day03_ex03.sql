/* Пожалуйста, найдите пиццерии, которые чаще посещали женщины или мужчины. Сохраните дубликаты для 
   любых операторов SQL с множествами (конструкции UNION ALL, EXCEPT ALL, INTERSECT ALL). 
   Отсортируйте результат по названию пиццерии. Пример данных показан ниже. */

WITH peoples AS (SELECT pizz.name pizzeria_name, p.gender
                 FROM person_visits pv
                 JOIN person p ON p.id = pv.person_id
                 JOIN pizzeria pizz ON pizz.id = pv.pizzeria_id)
(SELECT pizzeria_name
 FROM peoples
 WHERE gender = 'female'
 EXCEPT ALL
 SELECT pizzeria_name
 FROM peoples
 WHERE gender = 'male')
UNION ALL
(SELECT pizzeria_name
 FROM peoples
 WHERE gender = 'male'
 EXCEPT ALL
 SELECT pizzeria_name
 FROM peoples
 WHERE gender = 'female')
ORDER BY pizzeria_name