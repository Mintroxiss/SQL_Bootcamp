/* Создайте, пожалуйста, представление базы данных v_price_with_discount, которое возвращает заказы
   человека с именем человека, названием пиццы, реальной ценой и вычисляемой колонкой 
   discount_price (с примененной скидкой 10% и удовлетворяющей формуле price - price*0.1).
   Пожалуйста, отсортируйте результат по именам людей и названиям пицц и преобразуйте столбец 
   discount_price к целочисленному типу. Пример результата приведен ниже. */

CREATE VIEW v_price_with_discount AS (SELECT p.name,
                                             m.pizza_name,
                                             m.price,
                                             (m.price - m.price * 0.1)::int AS discount_price
                                      FROM person_order pord
                                      JOIN person p ON p.id = pord.person_id
                                      JOIN menu m ON m.id = pord.menu_id
                                      ORDER BY name, pizza_name)
