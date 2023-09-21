-- List champions and their number(s) of championships since 2013 (Louisville's Championship in 2013 was vacated)
SELECT TEAM AS CHAMPIONS, COUNT(*) AS 'CHAMPIONSHIPS WON'
FROM CBB WHERE POSTSEASON = 'Champions'
GROUP BY TEAM
ORDER BY 2 DESC

-- Lists runners up and their number(s) of championships losts since 2013
SELECT TEAM AS 'RUNNERS UP', COUNT(*) AS 'CHAMPIONSHIPS LOST'
FROM CBB WHERE POSTSEASON = '2nd'
GROUP BY TEAM
ORDER BY 2 DESC

-- Lists amount of championships won by conferences since 2013
SELECT CONF, COUNT(*) AS 'CHAMPIONS CONFERNCE' 
FROM(
	SELECT CONF FROM CBB WHERE POSTSEASON = 'Champions'
) AS champions_conf
GROUP BY CONF
ORDER BY 2 DESC

-- Lists amount of championships lost by conferences since 2013
SELECT CONF, COUNT(*) AS 'RUNNERS UP CONFERNCE' 
FROM(
	SELECT CONF FROM CBB WHERE POSTSEASON = '2nd'
) AS runners_up_conf
GROUP BY CONF
ORDER BY 2 DESC

-- Calculates the average Adjusted Offensive Efficiency (ADJOE) and Adjusted Defensive Efficiency (ADJDE) per year
SELECT AVG(ADJOE) AS 'Average ADJOE', YEAR, AVG(ADJDE) AS 'Average ADJDE' 
FROM CBB 
GROUP BY YEAR 
ORDER BY 2 DESC

-- Average win by conferences since 2013
SELECT CONF, AVG(W) AS 'Average Wins By Conference since 2013' from CBB
GROUP BY CONF
ORDER BY 2 DESC

-- selects the average ADJOE by teams sorted by their success in the postseason
SELECT AVG(ADJOE) AS 'ADJOE', POSTSEASON FROM CBB
GROUP BY POSTSEASON
ORDER BY 1 DESC

-- selects the average ADJDE by teams sorted by their success in the postseason
SELECT AVG(ADJDE) AS 'ADJDE', POSTSEASON FROM CBB
GROUP BY POSTSEASON
ORDER BY 1 DESC


-- Finds the effective field goal percentage shot (EFG_O) and effective field goal percentage allowed(EFG_D) in 2023, 2018 and 2013
-- Also lists the teams postseason qualification status
SELECT EFG_O AS 'Field Goal % Made', EFG_D AS 'Field Goal % Allowed', POSTSEASON AS '2023 Postseason Qualification', Team
FROM CBB
WHERE YEAR = '2023'
ORDER BY POSTSEASON 

SELECT EFG_O AS 'Field Goal % Made', EFG_D AS 'Field Goal % Allowed', POSTSEASON AS '2018 Postseason Qualification', Team
FROM CBB
WHERE YEAR = '2018'
ORDER BY POSTSEASON 

SELECT EFG_O AS 'Field Goal % Made', EFG_D AS 'Field Goal % Allowed', POSTSEASON AS '2013 Postseason Qualification', Team
FROM CBB
WHERE YEAR = '2013'
ORDER BY POSTSEASON 
-------------------------------------------------

-- selects wins above bubble, and the calculated win percentage rounded to 1 decimalm place
SELECT WAB as 'Wins Above Bubble', CAST(((W * 100.0) / G) AS DECIMAL(18,1)) AS 'Win %'
FROM CBB
