/* Напишите SQL-запрос, который возвращает имя человека и соответствующее количество посещений любой пиццерии,
   если человек посетил ее более 3 раз (> 3). Пожалуйста, посмотрите на пример данных ниже. */

SELECT p.name,
       COUNT(*) AS count_of_visits
FROM person_visits pv
JOIN person p ON p.id = pv.person_id
GROUP BY name
HAVING COUNT(*) > 3

