/* Напишите 2 оператора SQL, которые возвращают список пиццерий, которые не были посещены людьми,
    используя IN для первого и EXISTS для второго. */

SELECT name
FROM pizzeria
WHERE id NOT IN (SELECT pizzeria_id 
                 FROM person_visits)

-- SELECT piz.name
-- FROM pizzeria piz
-- WHERE NOT EXISTS (SELECT persvis.pizzeria_id
--                   FROM person_visits persvis
--                   WHERE persvis.pizzeria_id = piz.id)