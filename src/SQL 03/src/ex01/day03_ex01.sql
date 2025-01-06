/* Найдите все идентификаторы меню, которые никем не упорядочены. Результат должен быть
   отсортирован по идентификатору. Пример вывода показан ниже. */

SELECT id AS menu_id
FROM menu
EXCEPT
SELECT menu_id
FROM person_order
ORDER BY menu_id
