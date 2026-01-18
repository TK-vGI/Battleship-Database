/*
START STAGE 3
*/
SELECT country,
       COUNT(*) as num_battleships
FROM Classes
WHERE type = 'bb'
GROUP BY country
ORDER BY num_battleships DESC
LIMIT 1;
    
/*
END STAGE 3
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

 */