/* Давайте проверим один из известных шаблонов базы данных «фантомные чтения», но на уровне изоляции READ COMMITTED. Пожалуйста, суммируйте все рейтинги для всех пиццерий в 
   одном режиме транзакции для сессии #1, а затем сделайте INSERT нового ресторана «Казанская пицца» с рейтингом 5 и ID=10 в сессии #2 (в том же порядке, что и на рисунке). */
   
-- сессия 1
BEGIN;
-- сессия 2
BEGIN;
-- сессия 1
SELECT SUM(rating) FROM pizzeria;
-- сессия 2
INSERT INTO pizzeria(id, name, rating) VALUES (10, 'Kazan Pizza', 5);
COMMIT;
-- сессия 1
SELECT SUM(rating) FROM pizzeria;
COMMIT;
SELECT SUM(rating) FROM pizzeria;
-- сессия 2
SELECT SUM(rating) FROM pizzeria;

