SELECT person_id,
       count_of_visits
  FROM (SELECT person_id,
               count(person_id) AS count_of_visits
          FROM person_visits pv
          GROUP BY person_id) AS v
 ORDER BY count_of_visits DESC,
          person_id;