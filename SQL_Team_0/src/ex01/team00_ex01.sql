CREATE VIEW all_paths AS (
    WITH RECURSIVE path AS (
        SELECT n1.point1::bpchar AS tour,
            n1.point1,
            n1.point2,
            n1.cost AS total
        FROM nodes n1
        WHERE n1.point1 = 'a'
        UNION
        SELECT concat(new.tour, ',', new.point2) AS tour,
            n2.point1,
            n2.point2,
            n2.cost + new.total AS total
        FROM nodes n2
            JOIN path new ON n2.point1 = new.point2
        WHERE new.tour NOT LIKE concat('%', new.point2, '%')
    )
    SELECT total,
        concat('{', path.tour, ',a}') as tour
    FROM path
    WHERE length(tour) = 7
        AND path.point2 = 'a'
);
SELECT p.total AS total_cost,
    tour
FROM all_paths p
ORDER BY total_cost,
    tour;
DROP VIEW IF EXISTS all_paths;