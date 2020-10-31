-- 1.
SELECT name, continent, population FROM world

-- 2.
SELECT name FROM world
WHERE population > 200000000

-- 3.
select name, gdp / population
from world
where population > 200000000

-- 4.
select name, population / 1000000
from world
where continent = 'South America'

-- 5.
select name, population
from world
where name in ('France', 'Germany', 'Italy')

-- 6.
select name
from world
where name like '%United%'

-- 7.
select name, population, area
from world
where area > 3000000 or population > 250000000

-- 8.
select name, population, area
from world
where area > 3000000 xor population > 250000000

-- 9.
select name, round(population / 1000000, 2), round(gdp / 1000000000, 2)
from world
where continent = 'South America'

-- 10.
select name, round(gdp / population, -3)
from world
where gdp > 1000000000000

-- 11.
select name, capital
from world
where length(name) = length(capital)

-- 12.
select name, capital
from world
where left(name, 1) = left(capital, 1)
and name <> capital

-- 13.
select name
from world
where name like '%a%'
and name like '%e%'
and name like '%i%'
and name like '%o%'
and name like '%u%'
and name not like '% %'
