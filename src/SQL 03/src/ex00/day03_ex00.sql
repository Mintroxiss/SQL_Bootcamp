/* Напишите SQL-запрос, который возвращает список названий пицц, цен на них, названий пиццерий
   и дат посещения для Kate и для цен от 800 до 1000 рублей. Отсортируйте список по пицце, 
   цене и названию пиццерии. Пример данных приведен ниже. */


SELECT m.pizza_name,
       m.price,
       pizz.name AS pizzeria_name,
       pv.visit_date
FROM menu m 
JOIN pizzeria pizz ON pizz.id = m.pizzeria_id
JOIN person_visits pv ON pv.pizzeria_id = pizz.id
JOIN person p ON pv.person_id = p.id
WHERE p.name = 'Kate'
  AND m.price BETWEEN 800 AND 1000
ORDER BY pizza_name, price, pizzeria_name
