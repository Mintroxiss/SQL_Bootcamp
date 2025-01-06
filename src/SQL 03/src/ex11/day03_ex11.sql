/* Пожалуйста, измените цену «греческой пиццы» на -10% от текущей стоимости */

UPDATE menu
SET price = (price * 0.9)::int
WHERE pizza_name = 'greek pizza'
