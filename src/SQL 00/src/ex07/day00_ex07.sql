/* Давайте применим интервалы данных к таблице person.
    Составьте SQL-оператор, который возвращает идентификаторы персон, 
    имена персон и интервал возраста персон (задайте имя нового вычисляемого столбца как 'interval_info') 
    на основе приведенного ниже псевдокода. И да... пожалуйста, сортируйте результат 
    по столбцу 'interval_info' в режиме возрастания.*/

SELECT id, name,
    CASE
        WHEN age >= 10 AND age <= 20 THEN 'interval #1'
        WHEN age > 20 AND age < 24 THEN 'interval #2'
        ELSE 'interval #3'
    END AS interval_info
FROM person
ORDER BY interval_info
        