/*
START STAGE 5
*/
SELECT
    s.name,
    s.launched,
    c.country
FROM Ships s
JOIN Classes c
    ON s.class = c.class
WHERE s.launched = (
    SELECT MIN(s2.launched)
    FROM Ships s2
    JOIN Classes c2
        ON s2.class = c2.class
    WHERE c2.country = c.country
)
GROUP BY s.name, s.launched, c.country
ORDER BY s.launched;
    
/*
END STAGE 5
*/

/*
Other Solution CTE
--
WITH Earliest AS (
    SELECT
        c.country,
        MIN(s.launched) AS earliest_launch
    FROM Ships s
    JOIN Classes c
        ON s.class = c.class
    GROUP BY c.country
)
SELECT
    s.name,
    s.launched,
    c.country
FROM Ships s
JOIN Classes c
    ON s.class = c.class
JOIN Earliest e
    ON e.country = c.country
   AND e.earliest_launch = s.launched
GROUP BY s.name, s.launched, c.country
ORDER BY s.launched ASC;
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
SELECT s.name, s.launched, c.country
FROM Ships s
JOIN Classes c ON s.class = c.class
WHERE s.launched IN (
    SELECT MIN(s2.launched)
    FROM Ships s2
    JOIN Classes c2 ON s2.class = c2.class
    GROUP BY c2.country
)
ORDER BY s.launched;
 */

/*
Other Solution
--
WITH earliestLaunchesByCountry AS (
    SELECT c2.country, MIN(s2.launched)
    FROM Ships s2
    JOIN Classes c2 ON s2.class = c2.class
    GROUP BY c2.country
)
SELECT s1.name, s1.launched, c1.country
FROM Ships s1
JOIN Classes c1
ON s1.class = c1.class
WHERE (c1.country, s1.launched) IN (
    SELECT * FROM earliestLaunchesByCountry
    )
ORDER BY s1.launched;
 */