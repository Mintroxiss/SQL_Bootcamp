/* Мы знаем персональные адреса из наших данных. Предположим, что этот человек посещает только пиццерии в
   своем городе. Напишите SQL-оператор, который возвращает адрес, название пиццерии и сумму заказов этого
   человека. Результат должен быть отсортирован по адресу, а затем по названию ресторана. Посмотрите на 
   пример выходных данных ниже. */

SELECT p.address,
       pizz.name,
       COUNT(*) AS count_of_orders
FROM person_order perord
JOIN menu m ON m.id = perord.menu_id
JOIN pizzeria pizz ON pizz.id = m.pizzeria_id
JOIN person p ON p.id = perord.person_id
GROUP BY p.address,
         pizz.name
ORDER BY address,
         name
