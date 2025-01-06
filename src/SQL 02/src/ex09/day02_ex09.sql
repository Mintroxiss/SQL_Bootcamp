/* Найдите имена всех женщин, которые заказывали пиццу с пепперони и сыром (в любое время и 
   в любых пиццериях). Убедитесь, что результат упорядочен по имени человека. Пример 
   данных показан ниже. */

SELECT DISTINCT p.name
FROM person p
JOIN person_order p_or ON p_or.person_id = p.id
JOIN menu m ON m.id = p_or.menu_id
WHERE p.gender = 'female'
  AND p.name IN (SELECT p.name
                 FROM person p
                 JOIN person_order p_or ON p_or.person_id = p.id
                 JOIN menu m ON m.id = p_or.menu_id
                 WHERE m.pizza_name = 'cheese pizza')
  AND p.name IN (SELECT p.name
                 FROM person p
                 JOIN person_order p_or ON p_or.person_id = p.id
                 JOIN menu m ON m.id = p_or.menu_id
                 WHERE m.pizza_name = 'pepperoni pizza')
ORDER BY p.name