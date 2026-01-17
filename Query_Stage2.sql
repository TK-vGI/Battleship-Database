/*
START STAGE 2
*/
SELECT class, numGuns
FROM Classes
WHERE numGuns = (
    SELECT MAX(numGuns)
    FROM Classes);
    
/*
END STAGE 2
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