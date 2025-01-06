/* Пожалуйста, найдите название пиццерии, которую Дмитрий посетил 8 января 2022 года и смог
   съесть пиццу менее чем за 800 рублей */

SELECT pizz.name AS pizzeria_name
FROM person_visits pers
JOIN person p ON p.id = pers.person_id
JOIN pizzeria pizz ON pizz.id = pers.pizzeria_id
JOIN menu m ON m.pizzeria_id = pizz.id
WHERE pers.visit_date = '2022-01-08'
  AND p.name = 'Dmitriy'
  AND m.price < 800