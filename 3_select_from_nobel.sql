-- 1.
SELECT yr, subject, winner
FROM nobel
WHERE yr = 1950

-- 2.
SELECT winner
FROM nobel
WHERE yr = 1962
AND subject = 'Literature'

-- 3.
select yr, subject
from nobel
where winner = 'Albert Einstein'

-- 4.
select winner
from nobel
where yr >= 2000
and subject = 'Peace'

-- 5.
select *
from nobel
where yr between 1980 and 1989
and subject = 'Literature'

-- 6.
select *
from nobel
where winner in ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama')

-- 7.
select winner
from nobel
where winner like 'John%'

-- 8.
select *
from nobel
where (subject = 'Physics' and yr = 1980)
or (subject = 'Chemistry' and yr = 1984)

-- 9.
select *
from nobel
where yr = 1980
and subject not in ('Chemistry', 'Medicine')

-- 10.
select *
from nobel
where (subject = 'Medicine' and yr < 1910)
or (subject = 'Literature' and yr >= 2004)

-- 11.
select *
from nobel
where winner = 'PETER GRÜNBERG'

-- 12.
select *
from nobel
where winner = 'EUGENE O''NEILL'

-- 13.
select winner, yr, subject
from nobel
where winner like 'Sir%'
order by yr desc, winner

-- 14.
select winner, subject
from nobel
where yr = 1984
order by subject in ('Chemistry', 'Physics'), subject, winner
