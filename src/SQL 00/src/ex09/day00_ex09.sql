/* Составьте оператор select, который возвращает имена людей и названия пиццерий на основе таблицы 
    person_visits с датой посещения в период с 07 по 09 января 2022 года (включая все дни) 
    (на основе внутреннего запроса в предложении `FROM').
    Посмотрите на шаблон итогового запроса.
    Добавьте, пожалуйста, пункт упорядочивания по имени человека 
    в порядке возрастания и по названию пиццерии в порядке убывания. */

SELECT (SELECT p.name
        FROM person p
        WHERE p.id = pv.person_id) AS person_name,
       (SELECT pz.name
        FROM pizzeria pz
        WHERE pz.id = pv.pizzeria_id) AS pizzeria_name
FROM (SELECT person_id, pizzeria_id, visit_date
      FROM person_visits
      WHERE visit_date BETWEEN '07.01.2022'::date AND '09.01.2022'::date) AS pv
ORDER BY person_name, pizzeria_name DESC
