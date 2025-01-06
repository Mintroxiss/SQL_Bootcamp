/* Теперь давайте рассмотрим функции pl/pgsql.
   Создайте функцию pl/pgsql fnc_person_visits_and_eats_on_date на основе SQL-оператора, которая будет
   находить названия пиццерий, которые посетил человек (IN pperson параметр со значением по 
   умолчанию 'Dmitriy') и где он мог купить пиццу дешевле заданной суммы в рублях (IN pprice
   параметр со значением по умолчанию 500) в заданную дату (IN pdate параметр со значением по
   умолчанию 8 января 2022 года). */

CREATE FUNCTION fnc_person_visits_and_eats_on_date(pperson varchar = 'Dmitriy',
                                                   pprice int = 500,
                                                   pdate date = '2022-01-08')
RETURNS TABLE (pizzeria_name varchar) AS $fnc_person_visits_and_eats_on_date$
BEGIN
  RETURN QUERY
  SELECT DISTINCT pizz.name
  FROM pizzeria pizz
  JOIN menu m ON m.pizzeria_id = pizz.id
  JOIN person_visits pv ON pv.pizzeria_id = pizz.id
  JOIN person p ON p.id = pv.person_id
  WHERE p.name = pperson
    AND m.price < pprice
    AND pv.visit_date = pdate;
END;
$fnc_person_visits_and_eats_on_date$ LANGUAGE plpgsql;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

-- select *
-- from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');