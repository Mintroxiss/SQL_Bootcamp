/* Как вы помните, мы создали 2 представления базы данных для разделения данных из таблиц персон по признаку 
   пола.
   Пожалуйста, определите 2 SQL-функции (заметьте, не pl/pgsql-функции) с именами:
   - fnc_persons_female (должна возвращать лиц женского пола),
   - fnc_persons_male (должна возвращать лиц мужского пола). */

CREATE FUNCTION fnc_persons_male() RETURNS TABLE (id bigint,
                                                  name varchar,
                                                  age integer,
                                                  gender varchar,
                                                  address varchar) AS $fnc_persons_male$ (
SELECT * 
FROM person
WHERE gender = 'male'
)
$fnc_persons_male$ LANGUAGE sql;


CREATE FUNCTION fnc_persons_female() RETURNS TABLE (id bigint,
                                                  name varchar,
                                                  age integer,
                                                  gender varchar,
                                                  address varchar) AS $fnc_persons_female$ (
SELECT * 
FROM person
WHERE gender = 'female'
)
$fnc_persons_female$ LANGUAGE sql;

SELECT *
FROM fnc_persons_male();

-- SELECT *
-- FROM fnc_persons_female();
