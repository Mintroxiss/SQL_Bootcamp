/* Перепишите SQL-оператор из упражнения №07, используя конструкцию NATURAL JOIN. 
    Результат должен быть таким же, как и в упражнении №07. */

SELECT perord.order_date, per.name || ' (age:' || per.age || ')' AS person_information
FROM (SELECT name, age, id AS person_id
      FROM person) per
NATURAL JOIN person_order perord
ORDER BY order_date, person_information