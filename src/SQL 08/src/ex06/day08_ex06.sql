/* Давайте проверим один из известных шаблонов базы данных «Призрачное чтение», но на уровне изоляции REPEATABLE READ. Пожалуйста, суммируйте все рейтинги для всех
   пиццерий в одном режиме транзакции для сессии #1, а затем сделайте INSERT нового ресторана 'Kazan Pizza 2' с рейтингом 4 и ID=11 в сессии #2 */

-- сессия 1
BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- сессия 2
BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- сессия 1
SELECT SUM(rating) FROM pizzeria;
-- сессия 2
INSERT INTO pizzeria(id, name, rating) VALUES (11, 'Kazan Pizza 2', 4);
COMMIT;
-- сессия 1
SELECT SUM(rating) FROM pizzeria;
COMMIT;
SELECT SUM(rating) FROM pizzeria;
-- сессия 2
SELECT SUM(rating) FROM pizzeria;
