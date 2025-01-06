/* Напишите SQL-запрос, который возвращает заказы с фактической ценой и ценой с учетом скидки для каждого
   человека в соответствующем ресторане-пиццерии, отсортированные по имени человека и названию пиццы.
   Ниже приведен пример данных. */

SELECT per.name,
       m.pizza_name,
       m.price,
       ROUND(m.price / 100 * (100 - pd.discount)) AS discount_price,
       pizz.name AS pizzeria_name
FROM person_order perord
JOIN person per ON per.id = perord.person_id
JOIN menu m ON m.id = perord.menu_id
JOIN pizzeria pizz ON pizz.id = m.pizzeria_id
JOIN person_discounts pd ON (pd.person_id = perord.person_id AND pd.pizzeria_id = m.pizzeria_id)
ORDER BY name, pizza_name
