/* Сделайте 2 синтаксически разных оператора select, которые возвращают список пиццерий 
    (название пиццерии и рейтинг) с рейтингом от 3,5 до 5 баллов (включая лимитные баллы) 
    и упорядоченных по рейтингу пиццерии. */
	
SELECT name, rating
FROM pizzeria
WHERE rating BETWEEN 3.5 AND 5
ORDER BY rating

-- SELECT name, rating
-- FROM pizzeria
-- WHERE rating >= 3.5 
--     AND rating <= 5
-- ORDER BY rating