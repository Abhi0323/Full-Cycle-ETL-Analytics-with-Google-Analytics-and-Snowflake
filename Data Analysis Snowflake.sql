--1 Counts the number of active users in each country
SELECT COUNTRY, SUM(ACTIVEUSERS) as TotalActiveUsers
FROM PORTFOLIO_ANALYSIS
GROUP BY COUNTRY
ORDER BY TotalActiveUsers DESC;

--2 Calculates the average session duration for each device category
SELECT DEVICECATEGORY, AVG(AVERAGESESSIONDURATION) as AvgSessionDuration
FROM PORTFOLIO_ANALYSIS
GROUP BY DEVICECATEGORY;

--3 Compares the count of new users versus returning users
SELECT NEWVSRETURNING, COUNT(*) as UserCount
FROM PORTFOLIO_ANALYSIS
GROUP BY NEWVSRETURNING;

--4 Identifies the top 5 cities with the highest user engagement duration
SELECT CITY, SUM(USERENGAGEMENTDURATION) as TotalEngagementDuration
FROM PORTFOLIO_ANALYSIS
WHERE CITY != '(not set)'
GROUP BY CITY
ORDER BY TotalEngagementDuration DESC
LIMIT 5;

--5 Analyzes the bounce rate for each day of the week
SELECT DAYOFWEEKNAME, AVG(BOUNCERATE) as AvgBounceRate
FROM PORTFOLIO_ANALYSIS
GROUP BY DAYOFWEEKNAME;

--6 Finds the most common first user source
SELECT FIRSTUSERSOURCE, COUNT(*) as SourceCount
FROM PORTFOLIO_ANALYSIS
GROUP BY FIRSTUSERSOURCE
ORDER BY SourceCount DESC
LIMIT 1;

--7 Analyzes the correlation between screen page views and sessions
SELECT AVG(SCREENPAGEVIEWS) as AvgPageViews, AVG(SESSIONS) as AvgSessions
FROM PORTFOLIO_ANALYSIS;

--8 Tracks how user engagement duration changes over time
SELECT DATE, AVG(USERENGAGEMENTDURATION) as AvgEngagementDuration
FROM PORTFOLIO_ANALYSIS
GROUP BY DATE
ORDER BY DATE;

--9 Shows the trend of new user acquisition for each country over time
SELECT DATE, COUNTRY, SUM(NEWUSERS) as TotalNewUsers
FROM PORTFOLIO_ANALYSIS
GROUP BY DATE, COUNTRY
ORDER BY DATE, COUNTRY;

--10 Analyzes how the event count per user varies across different device categories
SELECT DEVICECATEGORY, AVG(EVENTCOUNTPERUSER) as AvgEventCountPerUser
FROM PORTFOLIO_ANALYSIS
GROUP BY DEVICECATEGORY;

--11 Identifies cities with the highest bounce rates
SELECT CITY, AVG(BOUNCERATE) as AvgBounceRate
FROM PORTFOLIO_ANALYSIS
WHERE CITY != '(not set)'
GROUP BY CITY
ORDER BY AvgBounceRate DESC
LIMIT 5;

--12 Compares the average number of screen page views on weekdays versus weekends
SELECT 
    CASE 
        WHEN DAYOFWEEKNAME IN ('Saturday', 'Sunday') THEN 'Weekend'
        ELSE 'Weekday'
    END as DayType,
    AVG(SCREENPAGEVIEWS) as AvgPageViews
FROM PORTFOLIO_ANALYSIS
GROUP BY DayType;

--13 Examines user engagement based on the first user source
SELECT FIRSTUSERSOURCE, AVG(USERENGAGEMENTDURATION) as AvgEngagementDuration
FROM PORTFOLIO_ANALYSIS
GROUP BY FIRSTUSERSOURCE;

--14 Compares the ratio of active users to new users for each country
SELECT COUNTRY, 
    SUM(ACTIVEUSERS) as TotalActiveUsers, 
    SUM(NEWUSERS) as TotalNewUsers, 
    (SUM(ACTIVEUSERS) * 1.0 / SUM(NEWUSERS)) as ActiveNewUserRatio
FROM PORTFOLIO_ANALYSIS
GROUP BY COUNTRY;

--15 Analyzes the distribution of engagement sessions across different device categories
SELECT DEVICECATEGORY, SUM(ENGAGEDSESSIONS) as TotalEngagedSessions
FROM PORTFOLIO_ANALYSIS
GROUP BY DEVICECATEGORY;

--16 Investigates the relationship between session duration and bounce rate
SELECT 
    AVG(AVERAGESESSIONDURATION) as AvgSessionDuration, 
    AVG(BOUNCERATE) as AvgBounceRate
FROM PORTFOLIO_ANALYSIS;

--17 Provides an overview of user metrics at the city level
SELECT 
    CITY, 
    SUM(ACTIVEUSERS) as TotalActiveUsers, 
    SUM(NEWUSERS) as TotalNewUsers, 
    AVG(AVERAGESESSIONDURATION) as AvgSessionDuration, 
    AVG(BOUNCERATE) as AvgBounceRate
FROM PORTFOLIO_ANALYSIS
WHERE CITY != '(not set)'
GROUP BY CITY;

--18 Analyzes the correlation between event count and page views by country
SELECT COUNTRY, AVG(EVENTCOUNT) as AvgEventCount, AVG(SCREENPAGEVIEWS) as AvgPageViews
FROM PORTFOLIO_ANALYSIS
GROUP BY COUNTRY;

--19 Analyzes how the day of the week impacts the ratio of new vs returning users
SELECT DAYOFWEEKNAME, 
    SUM(CASE WHEN NEWVSRETURNING = 'new' THEN 1 ELSE 0 END) as NewUsers,
    SUM(CASE WHEN NEWVSRETURNING = 'returning' THEN 1 ELSE 0 END) as ReturningUsers
FROM PORTFOLIO_ANALYSIS
GROUP BY DAYOFWEEKNAME;

--20 Calculates total user engagement duration and total sessions per month, providing insights into monthly user activity trends.
SELECT 
    TO_CHAR(DATE, 'YYYY-MM') as Month, 
    SUM(USERENGAGEMENTDURATION) as TotalEngagementDuration, 
    SUM(SESSIONS) as TotalSessions
FROM PORTFOLIO_ANALYSIS
GROUP BY TO_CHAR(DATE, 'YYYY-MM')
ORDER BY Month;