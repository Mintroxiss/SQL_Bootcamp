/* Найдите имена людей, которые живут по одному адресу. Убедитесь, что результат отсортирован  */

WITH prs AS (SELECT name, address, id
                 FROM person)
SELECT p.name AS person_name1,
       prs.name AS person_name2,
       p.address AS common_address
FROM person p
CROSS JOIN prs
WHERE prs.name != p.name
  AND p.address = prs.address
  AND p.id > prs.id
ORDER BY person_name1, person_name2, common_address
