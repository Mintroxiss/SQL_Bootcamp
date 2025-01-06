/* Пожалуйста, зарегистрируйте новые заказы всех лиц на «греческую пиццу» на 25 февраля 2022 года. */

INSERT INTO person_order
SELECT generate_series((SELECT MAX(id)
                        FROM person_order) + 1,
                       (SELECT COUNT(id)
                        FROM person) +
                       (SELECT MAX(id)
                        FROM person_order),
                       1),
       generate_series((SELECT MIN(id)
                        FROM person),
                       (SELECT MAX(id) FROM person),
                       1),
       (SELECT id 
        FROM menu
        WHERE pizza_name = 'greek pizza'),
       '2022-02-25'
