/* Мы хотим быть сильнее с данными и не хотим потерять ни одного события изменения. Давайте реализуем функцию
   аудита для входящих изменений INSERT.
   Создайте таблицу person_audit с той же структурой, что и таблица person, но добавьте в нее 
   несколько дополнительных изменений. Взгляните на таблицу ниже с описанием каждого столбца. Фактически, 
   давайте создадим триггерную функцию базы данных с именем fnc_trg_person_insert_audit, которая должна 
   обрабатывать DML-трафик INSERT и создавать копию новой строки в таблице person_audit.
   Небольшая подсказка: если вы хотите реализовать триггер PostgreSQL, вам нужно создать 
   2 объекта: Database Trigger Function и Database Trigger.
   Итак, определите триггер базы данных с именем trg_person_insert_audit со следующими параметрами:
   - триггер с опцией «FOR EACH ROW»;
   - триггер с опцией «AFTER INSERT»;
   - триггер вызывает триггерную функцию fnc_trg_person_insert_audit. */

CREATE TABLE person_audit (
  created timestamptz DEFAULT CURRENT_TIMESTAMP NOT NULL,
  type_event char(1) DEFAULT 'I' NOT NULL,
  row_id bigint NOT NULL,
  name varchar,
  age integer,
  gender varchar,
  address varchar,
  CONSTRAINT ch_type_event CHECK(type_event IN ('I', 'D', 'U'))
);

CREATE FUNCTION fnc_trg_person_insert_audit() RETURNS TRIGGER AS $fnc_trg_person_insert_audit$
BEGIN
  INSERT INTO person_audit(type_event, row_id, name, age, gender, address)
  VALUES('I', new.id, new.name, new.age, new.gender, new.address);
  RETURN NULL;
END;
$fnc_trg_person_insert_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit AFTER INSERT ON person
  FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address) 
VALUES (10,'Damir', 22, 'male', 'Irkutsk');

SELECT * FROM person_audit
