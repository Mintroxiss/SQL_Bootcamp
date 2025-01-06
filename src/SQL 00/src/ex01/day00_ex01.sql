/* Сделайте, пожалуйста, оператор select, который возвращает имена, 
    возраст всех женщин из города 'Казань'. Да, и, пожалуйста, отсортируйте результат по имени. */
	
SELECT name, age
FROM person
WHERE gender = 'female'
    AND address = 'Kazan'
ORDER BY name
