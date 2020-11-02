-- 1.
SELECT m8/10 FROM hadcet
WHERE yr = 1964 AND dy = 10

-- 2.
SELECT yr-1811 as age, m12 / 10 as temp
FROM hadcet
WHERE yr BETWEEN 1812 and 1812+11 AND dy = 25

-- 3.
SELECT yr - 1811 as age,
CASE WHEN min(m12) < 0 THEN 'White Christmas' ELSE 'No Snow' END
FROM hadcet
WHERE (yr BETWEEN 1812 AND 1812 + 11)
AND (dy BETWEEN 21 AND 25)
GROUP BY yr

-- 4.
-- NOT CORRECT

WITH year_wc (yr, wc) AS
(SELECT yr,
CASE WHEN min(m12) < 0 THEN 1 ELSE 0 END as wc
FROM hadcet
WHERE (dy BETWEEN 21 AND 25)
GROUP BY yr)

SELECT yr - 2, wcc
FROM
(SELECT yr, wc, SUM(wc) OVER (ORDER BY yr ROWS BETWEEN 0 PRECEDING AND 10 FOLLOWING) as wcc
FROM year_wc) as temp
WHERE wcc >= 7
