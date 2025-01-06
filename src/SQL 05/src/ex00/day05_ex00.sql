/* Пожалуйста, создайте простой индекс BTree для каждого внешнего ключа в нашей базе данных. Шаблон имени
   должен соответствовать следующему правилу «idx_{table_name}_{column_name}». Например, имя индекса 
   BTree для столбца pizzeria_id в таблице menu будет idx_menu_pizzeria_id. */

CREATE INDEX idx_menu_pizzeria_id ON menu(pizzeria_id);
CREATE INDEX idx_person_order_person_id ON person_order(person_id);
CREATE INDEX idx_person_order_menu_id ON person_order(menu_id);
CREATE INDEX idx_person_visits_person_id ON person_visits(person_id);
CREATE INDEX idx_person_visits_pizzeria_id ON person_visits(pizzeria_id);