/* Найдите имена всех женщин старше 25 лет и отсортируйте результат по имени. 
   Пример вывода показан ниже. */

SELECT name
FROM person
WHERE age > 25
  AND gender = 'female'
ORDER BY name
