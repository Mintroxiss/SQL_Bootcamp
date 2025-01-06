/* Используйте конструкцию SQL из упражнения 05 и добавьте новый вычисляемый столбец 
    (используйте имя столбца 'check_name') с оператором проверки 
    (псевдокод для этой проверки приведен ниже) в предложении SELECT */

SELECT 
    (SELECT p.name
     FROM person p
     WHERE p.id = po.person_id),
    CASE
        WHEN (SELECT p.name FROM person p WHERE p.id = po.person_id) = 'Denis' THEN true
        ELSE false
    END AS check_name
FROM person_order po
WHERE (po.menu_id = 13 OR po.menu_id = 14 OR po.menu_id = 18)
    AND po.order_date = '07.01.2022'::date