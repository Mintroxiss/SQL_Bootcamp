/* Давайте проверим один из известных шаблонов базы данных «Неповторяющиеся чтения», но на уровне изоляции SERIALIZABLE. Пожалуйста, проверьте рейтинг «Pizza Hut» в режиме 
   транзакции для сессии #1, а затем выполните UPDATE рейтинга до значения 3.0 в сессии #2 */

-- Сессия 1
BEGIN;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- Сессия 2
BEGIN;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- Сессия 1
SELECT id, name, rating FROM pizzeria WHERE name = 'Pizza Hut';
-- Сессия 2
UPDATE pizzeria SET rating = 3.0 WHERE name = 'Pizza Hut';
COMMIT;
-- Сессия 1
SELECT id, name, rating FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT;
SELECT id, name, rating FROM pizzeria WHERE name = 'Pizza Hut';
-- Сессия 2
SELECT id, name, rating FROM pizzeria WHERE name = 'Pizza Hut';

