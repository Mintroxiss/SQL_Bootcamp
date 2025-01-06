/* Давайте добавим в нашу модель данных новую бизнес-функцию.
   Каждый человек хочет видеть персональную скидку, а каждый бизнес хочет быть ближе к клиентам.
   Подумайте о персональных скидках для людей с одной стороны и о пиццериях с другой. Необходимо создать 
   новую реляционную таблицу (пожалуйста, задайте имя person_discounts) со следующими правилами.

   Установите атрибут id как первичный ключ (пожалуйста, посмотрите на столбец id в существующих таблицах 
   и выберите тот же тип данных).
   Установите атрибуты person_id и pizzeria_id в качестве внешних ключей для соответствующих таблиц 
   (типы данных должны быть такими же, как для столбцов id в соответствующих родительских таблицах).
   Задайте явные имена для ограничений внешних ключей, используя шаблон fk_{table_name}_{column_name}, 
   например fk_person_discounts_person_id.
   Добавьте атрибут discount для хранения значения скидки в процентах. Помните, что значение скидки может 
   быть числом с плавающей точкой (просто используйте тип данных numeric). Поэтому выберите соответствующий
   тип данных, чтобы учесть эту возможность. */

CREATE TABLE person_discounts (
  id bigint PRIMARY KEY,
  person_id bigint,
  pizzeria_id bigint,
  discount numeric,
  CONSTRAINT fk_person_discounts_person_id FOREIGN KEY (person_id) REFERENCES person(id),
  CONSTRAINT fk_person_discounts_pizzeria_id FOREIGN KEY (pizzeria_id) REFERENCES pizzeria(id)
);