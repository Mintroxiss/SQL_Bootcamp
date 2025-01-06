/* Перед запуском задачи убедитесь, что в вашей базе данных установлен стандартный уровень изоляции. Просто выполните следующий
   оператор SHOW TRANSACTION ISOLATION LEVEL; и результат должен быть «read committed». Если это не так, установите уровень изоляции read committed явно на уровне сеанса.
   Проверьте рейтинг «Pizza Hut» в режиме транзакции для обеих сессий, а затем выполните UPDATE рейтинга до значения 4 в сессии №1 и UPDATE рейтинга до значения 3,6
   в сессии №2 (в том же порядке, что и на рисунке). */

-- Сессия 1
BEGIN;
-- Сессия 2
BEGIN;
-- Сессия 1
SELECT id, name, rating FROM pizzeria WHERE name = 'Pizza Hut';
-- Сессия 2
SELECT id, name, rating FROM pizzeria WHERE name = 'Pizza Hut';
-- Сессия 1
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';
-- Сессия 2
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
-- Сессия 1
SELECT id, name, rating FROM pizzeria WHERE name = 'Pizza Hut';
-- Сессия 2
SELECT id, name, rating FROM pizzeria WHERE name = 'Pizza Hut';
-- Сессия 1
COMMIT;
-- Сессия 2
COMMIT;
-- Сессия 1
SELECT id, name, rating FROM pizzeria WHERE name = 'Pizza Hut';
-- Сессия 2
SELECT id, name, rating FROM pizzeria WHERE name = 'Pizza Hut';
