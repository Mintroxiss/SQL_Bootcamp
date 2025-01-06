/* Напишите, пожалуйста, функцию func_minimum (на ваше усмотрение) на SQL или pl/pgsql, входным параметром
   которой является массив чисел, а функция должна возвращать минимальное значение. */

CREATE FUNCTION func_minimum(VARIADIC arr numeric[]) RETURNS numeric AS $func_minimum$
  SELECT MIN(arr[i])
  FROM generate_subscripts(arr, 1) g(i)
$func_minimum$ LANGUAGE sql;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);