/* Сеанс #1:
   - Обновление рейтинга для «Пицца Хат» до 5 баллов в режиме транзакции.
   - Убедитесь, что вы видите изменения в сеансе № 1.
   Сессия №2:
   - Проверьте, что вы не видите изменений в сессии #2.
   
   Сессия №1:
   - Опубликуйте изменения для всех параллельных сессий.
   Сессия №2:
   - Проверьте, что вы можете видеть изменения в сессии №2. */
   
BEGIN;
-- Сессия 1
SELECT id, name, rating FROM pizzeria WHERE name = 'Pizza Hut';
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
SELECT id, name, rating FROM pizzeria WHERE name = 'Pizza Hut';
-- Сессия 2
SELECT id, name, rating FROM pizzeria WHERE name = 'Pizza Hut';
-- Сессия 1
COMMIT;
-- Сессия 2
SELECT id, name, rating FROM pizzeria WHERE name = 'Pizza Hut';
