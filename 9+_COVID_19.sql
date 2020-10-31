-- 1.
SELECT name, DAY(whn), confirmed, deaths, recovered
FROM covid
WHERE name = 'Spain'
AND MONTH(whn) = 3
ORDER BY whn

-- 2.
SELECT name, DAY(whn), confirmed,
LAG(confirmed, 1) OVER (PARTITION BY name ORDER BY whn) as dbf
FROM covid
WHERE name = 'Italy'
AND MONTH(whn) = 3
ORDER BY whn

-- 3.
SELECT name, DAY(whn),
confirmed - LAG(confirmed, 1) OVER (PARTITION BY name ORDER BY whn) as new
FROM covid
WHERE name = 'Italy'
AND MONTH(whn) = 3
ORDER BY whn

-- 4.
SELECT name, DATE_FORMAT(whn, '%Y-%m-%d'),
confirmed - LAG(confirmed, 1) OVER (PARTITION BY name ORDER BY whn) as new
FROM covid
WHERE name = 'Italy'
AND WEEKDAY(whn) = 0
ORDER BY whn

-- 5.
SELECT tw.name, DATE_FORMAT(tw.whn,'%Y-%m-%d'),
tw.confirmed - lw.confirmed
FROM covid tw LEFT JOIN covid lw ON
DATE_ADD(lw.whn, INTERVAL 1 WEEK) = tw.whn
AND tw.name = lw.name
WHERE tw.name = 'Italy'
AND WEEKDAY(tw.whn) = 0
ORDER BY tw.whn

-- 6.
SELECT name, confirmed,
RANK() OVER (ORDER BY confirmed DESC) rc,
deaths,
RANK() OVER (ORDER BY deaths DESC) rc
FROM covid
WHERE whn = '2020-04-20'
ORDER BY confirmed DESC

-- 7.
SELECT world.name, ROUND(100000 * confirmed / population, 0),
RANK() OVER (ORDER BY confirmed / population) as rank
FROM covid JOIN world ON covid.name = world.name
WHERE whn = '2020-04-20' AND population > 10000000
ORDER BY population DESC

-- 8.
with temp (name, whn, new) as
(select name, whn,
 confirmed - lag(confirmed, 1) over (partition by name order by whn) as new
 from covid)

select temp.name, date_format(whn, '%Y-%m-%d'), new as peakNewCases
from temp
join
(select name, max(new) as max_new
 from temp
 group by name
 having max_new >= 1000) as x
on temp.name = x.name and temp.new = x.max_new
order by date_format(whn, '%Y-%m-%d')
