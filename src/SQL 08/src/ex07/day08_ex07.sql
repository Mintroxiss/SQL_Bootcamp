/* Вы можете увидеть графическое представление тупиковой ситуации на рисунке. Это выглядит как «христовый замок» между параллельными сессиями. Напишите любой SQL-оператор
   с любым уровнем изоляции (можно использовать настройки по умолчанию) для таблицы pizzeria, чтобы воспроизвести эту тупиковую ситуацию. */

-- Сессия 1
BEGIN;
-- Сессия 2
BEGIN;
-- Сессия 1
UPDATE pizzeria SET rating = 0.1 WHERE id = 1;
-- Сессия 2
UPDATE pizzeria SET rating = 0.2 WHERE id = 2;
-- Сессия 1
UPDATE pizzeria SET rating = 2.0 WHERE id = 2;
-- Сессия 2
UPDATE pizzeria SET rating = 1.0 WHERE id = 1;
-- Сессия 1
COMMIT;
-- Сессия 2
COMMIT;

-- Сессия 1
SELECT id, name, rating FROM pizzeria WHERE id = 1 OR id = 2;
-- Сессия 2
SELECT id, name, rating FROM pizzeria WHERE id = 1 OR id = 2;
