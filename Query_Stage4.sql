/*
START STAGE 4
*/
SELECT
    c.country,
    COUNT(o.result) AS num_sunk_ships
FROM Classes c
JOIN Ships s
    ON c.class = s.class
JOIN Outcomes o
    ON s.name = o.ship
WHERE o.result = 'sunk'
GROUP BY c.country
ORDER BY num_sunk_ships DESC;
    
/*
END STAGE 4
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

 */

/*
Other Solution
--

 */

/*
Other Solution
--
SELECT
    Classes.country,
    COUNT(Outcomes.result) AS num_sunk_ships
FROM
    Classes
INNER JOIN Ships
    ON Classes.class = Ships.class
INNER JOIN Outcomes
    ON Ships.name = Outcomes.ship
WHERE
    Outcomes.result = 'sunk'
GROUP BY
    Classes.country
ORDER BY
    num_sunk_ships DESC
;
 */