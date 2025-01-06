/* Напишите, пожалуйста, SQL-запрос, который возвращает всех пользователей, все балансовые транзакции 
   (в этой задаче не учитываются валюты, у которых нет ключа в таблице Currency) с названием валюты и 
   рассчитанным значением валюты в USD за ближайший день. 
   - необходимо найти ближайший курс_к_usd валюты в прошлом (t1)
   - если t1 пуст (значит, в прошлом не было никаких курсов), то найти ближайший курс_к_usd валюты 
   в будущем (t2)
   - используйте курс t1 ИЛИ t2 для расчета валюты в формате USD
   Отсортируйте результат по имени пользователя по убыванию, а затем по фамилии пользователя и 
   названию валюты по возрастанию.*/

insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

CREATE FUNCTION exchange_rate(p_id bigint, p_date timestamp) RETURNS numeric AS $exchange_rate$
DeClARE res numeric = NULL;
BEGIN
WITH before_date AS (
  SELECT rate_to_usd,
         updated
  FROM currency
  WHERE updated < p_date
    AND id = p_id
  ORDER BY updated DESC
  LIMIT 1
),
later_date AS (
  SELECT rate_to_usd,
         updated
  FROM currency
  WHERE updated > p_date
    AND id = p_id
  ORDER BY updated 
  LIMIT 1
),
sort_dates AS (
  SELECT *
  FROM before_date
  UNION
  SELECT *
  FROM later_date
  ORDER BY updated
)
SELECT rate_to_usd INTO res
FROM sort_dates
LIMIT 1;
RETURN res;
END;
$exchange_rate$ LANGUAGE plpgsql;

SELECT DISTINCT COALESCE(u.name, 'not defined') AS name,
       COALESCE(u.lastname, 'not defined') AS lastname,
       c.name AS currency_name,
       b.money * exchange_rate(b.currency_id, b.updated) AS currency_in_usd
FROM balance b
JOIN currency c ON c.id = b.currency_id
LEFT JOIN public.user u ON u.id = b.user_id
ORDER BY name DESC,
         lastname,
         currency_name
