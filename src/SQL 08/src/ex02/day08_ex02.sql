/* Давайте рассмотрим один из известных шаблонов базы данных «Аномалия потерянных обновлений», но на уровне изоляции REPEATABLE READ.
   Проверьте рейтинг «Pizza Hut» в режиме транзакции для обеих сессий, а затем выполните UPDATE рейтинга до значения 4 в сессии №1 и 
   UPDATE рейтинга до значения 3,6 в сессии №2 */

-- Сессия 1
BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- Сессия 2
BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
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
COMMIT;
-- Сессия 2
COMMIT;
-- Сессия 1
SELECT id, name, rating FROM pizzeria WHERE name = 'Pizza Hut';
-- Сессия 2
SELECT id, name, rating FROM pizzeria WHERE name = 'Pizza Hut';
