/* Пожалуйста, найдите имена всех мужчин из Москвы или Самары, которые заказывают пиццу с 
   пепперони или грибами (или и то, и другое). Пожалуйста, отсортируйте результат по 
   именам в порядке убывания. Пример вывода показан ниже. */

SELECT DISTINCT p.name
FROM person p
JOIN person_order p_or ON p_or.person_id = p.id
JOIN menu m ON m.id = p_or.menu_id
WHERE p.gender = 'male'
  AND p.address IN ('Moscow', 'Samara')
  AND m.pizza_name IN ('pepperoni pizza', 'mushroom pizza')
ORDER BY p.name DESC
