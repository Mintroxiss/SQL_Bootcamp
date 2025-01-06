/* Создайте материализованное представление mv_dmitriy_visits_and_eats (с включенными данными) на основе
   SQL-запроса, который находит название пиццерии, где Дмитрий побывал 8 января 2022 года и смог съесть
   пиццу менее чем за 800 рублей (этот SQL можно найти в упражнении Day #02 Exercise #07).
   Чтобы проверить себя, вы можете написать SQL в материализованном представлении
   mv_dmitriy_visits_and_eats и сравнить результаты с предыдущим запросом. */

CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS (SELECT pizz.name AS pizzeria_name
                                                        FROM person_visits pers
                                                        JOIN person p ON p.id = pers.person_id
                                                        JOIN pizzeria pizz ON pizz.id = pers.pizzeria_id
                                                        JOIN menu m ON m.pizzeria_id = pizz.id
                                                        WHERE pers.visit_date = '2022-01-08'
                                                          AND p.name = 'Dmitriy'
                                                          AND m.price < 800)
