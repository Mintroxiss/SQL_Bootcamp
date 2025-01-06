/* Собственно, мы создали структуру для хранения наших скидок и готовы двигаться дальше, заполняя таблицу 
   person_discounts новыми записями.
   Итак, есть таблица person_order, в которой хранится история заказов человека. Напишите DML-оператор 
   (INSERT INTO ... SELECT ...), который вставляет новые записи в таблицу person_discounts, основываясь 
   на следующих правилах.
   - Возьмите агрегированное состояние из столбцов person_id и pizzeria_id.
   - Рассчитайте значение персональной скидки с помощью следующего псевдокода:
     if “amount of orders” = 1 then “discount” = 10.5  else if “amount of orders” = 2 then  
     “discount” = 22 else  “discount” = 30
   - Чтобы создать первичный ключ для таблицы person_discounts, используйте следующую конструкцию SQL:
	 ... ROW_NUMBER( ) OVER ( ) AS id ... */

INSERT INTO person_discounts(id, person_id, pizzeria_id, discount)
SELECT ROW_NUMBER() OVER () AS id,
       perord.person_id,
       m.pizzeria_id,
       CASE
         WHEN COUNT(*) = 1 THEN 10.5
         WHEN COUNT(*) = 2 THEN 22.0
         ELSE 30.0
       END AS discount
FROM person_order perord
JOIN menu m ON m.id = perord.menu_id
GROUP BY perord.person_id,
         m.pizzeria_id
