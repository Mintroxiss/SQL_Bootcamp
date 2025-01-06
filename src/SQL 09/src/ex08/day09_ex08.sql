/* Напишите SQL- или pl/pgsql-функцию fnc_fibonacci (на ваше усмотрение), которая имеет входной параметр 
   pstop типа integer (по умолчанию 10), а выходным параметром функции является таблица всех чисел 
   Фибоначчи, меньших, чем pstop. */

CREATE FUNCTION fnc_fibonacci(pstop int = 10) RETURNS TABLE (num int) AS $fnc_fibonacci$
  WITH RECURSIVE fibo(n1, n2) AS (
    SELECT 0::int, 1::int
	UNION ALL
    SELECT n2, n2 + n1
	FROM fibo
	WHERE n2 < pstop
  )
  SELECT n1
  FROM fibo;
$fnc_fibonacci$ LANGUAGE sql;

select * from fnc_fibonacci(100);
-- select * from fnc_fibonacci();
