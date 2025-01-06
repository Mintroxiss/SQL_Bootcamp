/* Напишите, пожалуйста, SQL-запрос, который возвращает список имен людей, заказавших пиццу в
    соответствующей пиццерии. Пример результата (с именованными столбцами) приведен ниже, и да... пожалуйста,
    сделайте упорядочивание по 3 столбцам (person_name, pizza_name, pizzeria_name) в возрастающем режиме. */

SELECT pers.name AS person_name, m.pizza_name, piz.name AS pizzeria_name
FROM person_order persord
JOIN person pers ON pers.id = persord.person_id
JOIN menu m ON m.id = persord.menu_id
JOIN pizzeria piz ON piz.id = m. pizzeria_id
ORDER BY person_name, pizza_name, pizzeria_name