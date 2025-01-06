/* Давайте обновим данные в нашем материализованном представлении mv_dmitriy_visits_and_eats из 
   упражнения #06. Перед этим действием создайте еще один визит Дмитрия, который удовлетворяет
   SQL-клаузу материализованного представления, кроме пиццерии, что мы можем видеть в 
   результате из упражнения #06.
   После добавления нового визита обновите состояние данных для mv_dmitriy_visits_and_eats. */

INSERT INTO person_visits(id,person_id,pizzeria_id,visit_date)
VALUES ((SELECT MAX(id) + 1
         FROM person_visits),
        (SELECT id
         FROM person
         WHERE name = 'Dmitriy'),
        (SELECT Z.id FROM menu M
         JOIN pizzeria Z ON Z.id=M.pizzeria_id
         WHERE price < 800 AND Z.name <> 'Papa Johns'
         LIMIT 1),
         '2022-01-08');

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;
