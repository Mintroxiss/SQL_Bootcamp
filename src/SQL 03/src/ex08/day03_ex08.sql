/* Зарегистрируйте новую пиццу с названием «sicilian pizza» (чей id должен быть рассчитан по формуле
   «максимальное значение id + 1») по цене 900 рублей в ресторане «Dominos» (используйте внутренний
   запрос для получения идентификатора пиццерии) */

INSERT INTO menu
VALUES ((SELECT MAX(id)
         FROM menu) + 1,
        (SELECT id
         FROM pizzeria
         WHERE name = 'Dominos'),
        'sicilian pizza',
        900)
