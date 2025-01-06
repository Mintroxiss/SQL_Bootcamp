/* Создайте представление базы данных (с именем v_generated_dates), которое должно «хранить» сгенерированные
   даты с 1 по 31 января 2022 года в типе DATE. Не забудьте про порядок столбца generated_date. */

CREATE VIEW v_generated_dates AS
SELECT generate_series('2022-01-01', '2022-01-31', '1 day'::interval)::date AS generated_date
ORDER BY generated_date
