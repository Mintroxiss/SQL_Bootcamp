/* Найдите полную информацию обо всех возможных названиях пиццерий и ценах на пиццу с грибами
   или пепперони. Затем отсортируйте результат по названию пиццы и названию пиццерии. Ниже
   показан результат для примера данных(пожалуйста, используйте те же имена столбцов в
   SQL-запросе). */

WITH pizz AS (SELECT pizza_name,
                     pizzeria_id AS id,
                     price
              FROM menu
              WHERE pizza_name = 'pepperoni pizza'
                OR pizza_name = 'mushroom pizza')
SELECT pizz.pizza_name,
       pizzeria.name AS pizzeria_name,
       pizz.price
FROM pizz
NATURAL JOIN pizzeria
ORDER BY pizza_name,
         pizzeria_name

