/* Напишите SQL-запрос, который возвращает общий объем (сумму всех денег) транзакций с баланса пользователя,
   агрегированных по пользователю и типу баланса. Обратите внимание, что должны быть обработаны все данные,
   включая данные с аномалиями. Ниже представлена таблица столбцов результата и соответствующая формула 
   расчета. */

WITH currency_last AS (
  SELECT *
  FROM currency c
  WHERE c.updated in (SELECT MAX(cur.updated)
                      FROM currency cur
                      WHERE c.id = cur.id)
)

SELECT COALESCE(u.name, 'not defined') AS name,
       COALESCE(u.lastname, 'not defined') AS lastname,
       b.type,
       SUM(b.money) AS volume,
       COALESCE(c.name, 'not defined') AS currency_name,
       COALESCE(c.rate_to_usd, 1) AS last_rate_to_usd,
       SUM(b.money) * COALESCE(c.rate_to_usd, 1) AS total_volume_in_usd
FROM balance b
LEFT JOIN public.user u ON b.user_id = u.id
LEFT JOIN currency_last c ON c.id = b.currency_id
GROUP BY u.name,
         lastname,
         type,
         currency_name,
         last_rate_to_usd,
		 rate_to_usd
ORDER BY name DESC, 
         lastname,
         type
