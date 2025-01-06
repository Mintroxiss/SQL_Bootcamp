/* Наконец, нам нужно обработать операцию DELETE и сделать копию состояния OLD для всех значений атрибутов.
   Пожалуйста, создайте триггер trg_person_delete_audit и соответствующую триггерную функцию 
   fnc_trg_person_delete_audit. */

CREATE FUNCTION fnc_trg_person_delete_audit() RETURNS TRIGGER AS $fnc_trg_person_delete_audit$
BEGIN
  INSERT INTO person_audit(type_event, row_id, name, age, gender, address)
  VALUES('D', old.id, old.name, old.age, old.gender, old.address);
  RETURN NULL;
END;
$fnc_trg_person_delete_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_delete_audit AFTER DELETE ON person
  FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_delete_audit();

DELETE FROM person WHERE id = 10;

SELECT * FROM person_audit;