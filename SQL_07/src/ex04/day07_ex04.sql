SELECT name, COUNT (*) as count_of_visits
FROM person_visits
JOIN person ON person.id = person_visits.person_id
GROUP BY person.name
HAVING COUNT(*) > 3
ORDER BY person.name;