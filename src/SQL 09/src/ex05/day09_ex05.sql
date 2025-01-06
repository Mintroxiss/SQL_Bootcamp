/* Похоже, что 2 функции из упражнения 04 нуждаются в более общем подходе. Пожалуйста, удалите эти функции 
   из базы данных, прежде чем продолжить.
   Напишите общую SQL-функцию (обратите внимание, не pl/pgsql-function) под названием fnc_persons. Эта 
   функция должна иметь IN-параметр pgender со значением по умолчанию = 'female'. */

CREATE FUNCTION fnc_persons(pgender varchar = 'female') RETURNS TABLE (id bigint,
                                                                       name varchar,
                                                                       age integer,
                                                                       gender varchar,
                                                                       address varchar) AS $fnc_persons$ (
  SELECT *
  FROM person
  WHERE gender = pgender
)
$fnc_persons$ LANGUAGE sql;

select *
from fnc_persons(pgender := 'male');

-- select *
-- from fnc_persons();
