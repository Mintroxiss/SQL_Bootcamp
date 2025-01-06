/* На самом деле для одной таблицы персон существует 3 триггера. Давайте объединим всю нашу логику в один 
   главный триггер trg_person_audit и новую соответствующую триггерную функцию fnc_trg_person_audit.
   Другими словами, весь DML-трафик (INSERT, UPDATE, DELETE) должен обрабатываться одним функциональным
   блоком. Пожалуйста, явно определите отдельный блок IF-ELSE для каждого события (I, U, D)!
   Кроме того, выполните следующие действия:
   - удалить 3 старых триггера из таблицы персон;
   - удалить 3 старые триггерные функции;
   - выполнить TRUNCATE (или DELETE) всех строк в нашей таблице person_audit. */

DROP TRIGGER trg_person_insert_audit ON person;
DROP TRIGGER trg_person_update_audit ON person;
DROP TRIGGER trg_person_delete_audit ON person;

DROP FUNCTION fnc_trg_person_delete_audit;
DROP FUNCTION fnc_trg_person_insert_audit;
DROP FUNCTION fnc_trg_person_update_audit;

CREATE FUNCTION fnc_trg_person_audit() RETURNS TRIGGER AS $fnc_trg_person_audit$
BEGIN
  IF (TG_OP = 'INSERT') THEN
    INSERT INTO person_audit(type_event, row_id, name, age, gender, address)
	VALUES('I', new.id, new.name, new.age, new.gender, new.address);
  ELSIF (TG_OP = 'UPDATE') THEN
    INSERT INTO person_audit(type_event, row_id, name, age, gender, address)
	VALUES('U', old.id, old.name, old.age, old.gender, old.address);
  ELSIF (TG_OP = 'DELETE') THEN
    INSERT INTO person_audit(type_event, row_id, name, age, gender, address)
	VALUES('D', old.id, old.name, old.age, old.gender, old.address);
  END IF;
  RETURN NULL;
END;
$fnc_trg_person_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_audit AFTER INSERT OR UPDATE OR DELETE ON person
  FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_audit();

INSERT INTO person(id, name, age, gender, address)  VALUES (10,'Damir', 22, 'male', 'Irkutsk');
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
DELETE FROM person WHERE id = 10;

SELECT * FROM person_audit