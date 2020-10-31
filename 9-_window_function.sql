-- 1.
SELECT lastName, party, votes
FROM ge
WHERE constituency = 'S14000024' AND yr = 2017
ORDER BY votes DESC

-- 2.
SELECT party, votes,
RANK() OVER (ORDER BY votes DESC) as posn
FROM ge
WHERE constituency = 'S14000024' AND yr = 2017
ORDER BY party

-- 3.
SELECT yr, party, votes,
RANK() OVER (PARTITION BY yr ORDER BY votes DESC) as posn
FROM ge
WHERE constituency = 'S14000021'
ORDER BY party, yr

-- 4.
SELECT constituency, party, votes,
RANK() OVER (PARTITION BY constituency ORDER BY votes DESC) as posn
FROM ge
WHERE constituency BETWEEN 'S14000021' AND 'S14000026'
AND yr = 2017
ORDER BY posn, constituency

-- 5.
SELECT constituency, party
FROM
(SELECT constituency, party, votes,
 RANK() OVER (PARTITION BY constituency ORDER BY votes DESC) as posn
 FROM ge
 WHERE constituency BETWEEN 'S14000021' AND 'S14000026'
 AND yr = 2017
 ORDER BY posn, constituency) as temp
WHERE posn = 1

-- 6.
SELECT party, COUNT(*)
FROM
(SELECT constituency, party, votes,
 RANK() OVER (PARTITION BY constituency ORDER BY votes DESC) as posn
 FROM ge
 WHERE constituency LIKE 'S%'
 AND yr = 2017
 ORDER BY posn, constituency) as temp
WHERE posn = 1
GROUP BY party
