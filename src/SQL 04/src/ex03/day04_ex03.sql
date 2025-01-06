/* Напишите SQL-оператор, который возвращает недостающие дни для посещений людей в январе 2022 года.
   Для этого используйте представление v_generated_dates и отсортируйте результат по столбцу 
   missing_date. Пример данных показан ниже. */

SELECT generated_date AS missing_date
FROM v_generated_dates 
WHERE generated_date not in (SELECT visit_date
                             FROM person_visits)
ORDER BY missing_date
