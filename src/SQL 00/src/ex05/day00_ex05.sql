/* Напишите оператор select, который возвращает имена людей 
    (на основе внутреннего запроса в предложении SELECT), сделавших заказы на меню с 
    идентификаторами 13, 14 и 18, причем дата заказов должна быть 7 января 2022 года. */

SELECT 
    (SELECT p.name
     FROM person p
     WHERE p.id = po.person_id)
FROM person_order po
WHERE (po.menu_id = 13 OR po.menu_id = 14 OR po.menu_id = 18)
    AND po.order_date = '07.01.2022'::date

