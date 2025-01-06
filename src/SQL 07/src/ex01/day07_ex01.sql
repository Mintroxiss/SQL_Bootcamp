/* Пожалуйста, измените SQL-оператор из упражнения 00 и верните имя человека (не идентификатор).
   Дополнительное условие - нам нужно увидеть только топ-4 людей с максимальным количеством 
   посещений в каждой пиццерии и отсортировать их по имени человека. Пример выходных данных см. ниже. */

SELECT p.name,
       COUNT (*) AS count_of_visits
FROM person_visits pv
JOIN person p ON pv.person_id = p.id
GROUP BY name
ORDER BY count_of_visits DESC, name
LIMIT 4
