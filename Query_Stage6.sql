/*
START STAGE 6
*/
WITH ClassBattleCounts AS (
    SELECT
        c.class,
        COUNT(DISTINCT o.battle) AS battle_count
    FROM Classes c
    JOIN Ships s
        ON c.class = s.class
    JOIN Outcomes o
        ON s.name = o.ship
    GROUP BY c.class
    HAVING COUNT(o.battle) >= 3
)
SELECT
    c.class,
    SUM(IF(o.result = 'damaged', 1, 0)) AS num_damaged,
    SUM(IF(o.result = 'sunk', 1, 0))    AS num_sunk,
    SUM(IF(o.result = 'ok', 1, 0))      AS num_ok
FROM ClassBattleCounts cb
JOIN Classes c
    ON cb.class = c.class
JOIN Ships s
    ON c.class = s.class
JOIN Outcomes o
    ON s.name = o.ship
GROUP BY c.class;
    
/*
END STAGE 6
*/

/*
Other Solution
--
SELECT
    s.class,
    SUM(CASE WHEN o.result = 'damaged' THEN 1 ELSE 0 END) AS num_damaged,
    SUM(CASE WHEN o.result = 'sunk' THEN 1 ELSE 0 END) AS num_sunk,
    SUM(CASE WHEN o.result = 'OK' THEN 1 ELSE 0 END) AS num_ok
FROM Ships s
JOIN Outcomes o ON s.name = o.ship
GROUP BY s.class
HAVING COUNT(o.ship) >= 3;
 */

/*
Other Solution
--

 */

/*
Other Solution
--

 */

/*
Other Solution
--
WITH ship_battles AS (SELECT s.class, o.result
                      FROM Outcomes o
                               JOIN Ships s ON o.ship = s.name),
     at_least_three_battles AS (SELECT class
                                FROM ship_battles
                                GROUP BY class
                                HAVING COUNT(*) >= 3),
     battle_stats AS (SELECT class,
                             SUM(CASE WHEN result = 'damaged' THEN 1 ELSE 0 END) as num_damaged,
                             SUM(CASE WHEN result = 'sunk' THEN 1 ELSE 0 END)    as num_sunk,
                             SUM(CASE WHEN result = 'ok' THEN 1 ELSE 0 END)      as num_ok
                      FROM ship_battles
                      GROUP BY class)
SELECT tb.class,
       COALESCE(bs.num_damaged, 0) as num_damaged,
       COALESCE(bs.num_sunk, 0)    as num_sunk,
       COALESCE(bs.num_ok, 0)      as num_ok
FROM at_least_three_battles tb
         LEFT JOIN battle_stats bs ON tb.class = bs.class;
 */

/*
Other Solution
--
SELECT s.class,
       (
       SELECT COUNT(*)
       FROM Outcomes o2
                JOIN Ships s2 ON o2.ship = s2.name
       WHERE o2.result = 'damaged'
         AND s2.class = s.class

       ) num_damaged,
       (
       SELECT COUNT(*)
       FROM Outcomes o3
                JOIN Ships s3 ON o3.ship = s3.name
       WHERE o3.result = 'sunk'
         AND s3.class = s.class

       ) num_sunk,
       (
       SELECT COUNT(*)
       FROM Outcomes o4
                JOIN Ships s4 ON o4.ship = s4.name
       WHERE o4.result = 'ok'
         AND s4.class = s.class

       ) num_ok
FROM Ships s
         JOIN Outcomes o ON s.name = o.ship
GROUP BY s.class
HAVING COUNT(*) >= 3
;
 */