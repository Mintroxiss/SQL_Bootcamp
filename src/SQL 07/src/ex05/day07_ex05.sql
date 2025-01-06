/* Напишите, пожалуйста, простой SQL-запрос, который возвращает список уникальных имен людей, сделавших
   заказ в любой пиццерии. Результат должен быть отсортирован по имени человека. Пожалуйста, посмотрите
   пример ниже. */

SELECT DISTINCT name
FROM person_order perord
JOIN person p ON p.id = perord.person_id
ORDER BY name
