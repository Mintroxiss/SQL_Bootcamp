/* Напишите, пожалуйста, SQL-запрос, который возвращает агрегированную информацию по адресу человека,
   результат «Максимальный возраст - (Минимальный возраст / Максимальный возраст)» представлен в виде
   столбца формулы, далее средний возраст по адресу и результат сравнения между столбцами формулы и 
   среднего (другими словами, если формула больше среднего, то True, иначе False). Результат должен 
   быть отсортирован по столбцам адресов. */

SELECT address,
       ROUND((MAX(age) - (MIN(age) / MAX(age::numeric))), 2)AS formula,
       ROUND(AVG(age), 2) AS average,
       CASE
         WHEN MAX(age) - (MIN(age) / MAX(age)) > AVG(age) THEN 'true'
         ELSE 'false'
       END AS comparison
FROM person
GROUP BY address
ORDER BY address
