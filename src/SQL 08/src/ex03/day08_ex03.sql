/* Давайте проверим один из известных шаблонов базы данных «Неповторяющиеся чтения», но на уровне изоляции READ COMMITTED.
   Пожалуйста, проверьте рейтинг «Пицца Хат» в режиме транзакции для сессии №1, а затем выполните UPDATE рейтинга до значения
   3,6 в сессии №2 (в том же порядке, что и на рисунке). */

-- Секция 1
BEGIN;
-- Секция 2
BEGIN;
-- Секция 1
SELECT id, name, rating FROM pizzeria WHERE name = 'Pizza Hut';
-- Секция 2
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
COMMIT;
-- Секция 1
SELECT id, name, rating FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT;
SELECT id, name, rating FROM pizzeria WHERE name = 'Pizza Hut';
-- Секция 2
SELECT id, name, rating FROM pizzeria WHERE name = 'Pizza Hut';
