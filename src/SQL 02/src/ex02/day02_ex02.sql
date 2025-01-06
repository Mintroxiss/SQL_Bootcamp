/* Напишите SQL-оператор, который вернет весь список имен людей, посетивших (или не посетивших)
   пиццерии в период с 1 по 3 января 2022 года, с одной стороны, и весь список названий пиццерий,
   которые были посещены (или не посещены), с другой стороны. Образец данных с необходимыми 
   названиями столбцов показан ниже. Обратите внимание на замену значения '-' для NULL-значений
   в столбцах person_name и pizzeria_name. Также добавьте порядок для всех трех столбцов. */

SELECT COALESCE(p.name, '-') AS person_name,
       COALESCE(visit_date:: text, 'null') AS visit_date,
       COALESCE(piz.name, '-') AS pizzeria_name
FROM person as p
FULL JOIN (SELECT person_id, pizzeria_id, visit_date
           FROM person_visits
           WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03') AS pv
             ON pv.person_id = p.id
FUll JOIN pizzeria piz ON piz.id = pv.pizzeria_id
ORDER BY person_name,
         visit_date,
         pizzeria_name