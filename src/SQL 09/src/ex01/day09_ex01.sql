/* Продолжим реализовывать наш шаблон аудита для таблицы person. Просто определите триггер 
   trg_person_update_audit и соответствующую триггерную функцию fnc_trg_person_update_audit для обработки 
   всего трафика UPDATE в таблице person. Мы должны сохранить OLD-состояния всех значений атрибутов. */

CREATE FUNCTION fnc_trg_person_update_audit() RETURNS TRIGGER AS $fnc_trg_person_update_audit$
BEGIN
  INSERT INTO public.person_audit(type_event, row_id, name, age, gender, address)
  VALUES('U', old.id, old.name, old.age, old.gender, old.address);
  RETURN NULL;
END;
$fnc_trg_person_update_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_update_audit AFTER UPDATE ON person
  FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_update_audit();

UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;

SELECT * FROM person_audit
