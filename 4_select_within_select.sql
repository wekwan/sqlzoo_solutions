-- 1.
SELECT name FROM world
WHERE population >
(SELECT population FROM world
 WHERE name='Russia')

-- 2.
select name
from world
where continent = 'Europe'
and gdp / population >
(select gdp / population
 from world
 where name = 'United Kingdom')

-- 3.
select name, continent
from world
where continent in
(select continent
 from world
 where name in ('Argentina', 'Australia'))
order by name

-- 4.
select name, population
from world
where population >
(select population
 from world
 where name = 'Canada')
and population <
(select population
 from world
 where name = 'Poland')

-- 5.
select name, concat(round((population / (select population from world where name = 'Germany')) * 100, 0), '%') as percentage
from world
where continent = 'Europe'

-- 6.
select name
from world
where gdp > all(select gdp from world where continent = 'Europe' and gdp > 0)

-- 7.
select continent, name, area
from world x
where area >=
all(select area from world y
 where x.continent = y.continent
 and area > 0)

-- 8.
select continent, name
from world x
where name <= all
(select name
 from world y
 where x.continent = y.continent and length(name) > 0)

select continent, min(name)
from world
group by continent

-- 9.
-- Used a subquery that got the max population in each continent and made it less than 25000000.

select name, continent, population
from world x
where continent in
(select continent
 from world y
 where x.continent = y.continent
 and population >= all(select population from world z where
 y.continent = z.continent and population > 0) and population <= 25000000)


-- 10.
-- Used subqueries that got 3 * population of every continent excluding the country with the maximum population.

select name, continent
from world x
where population >= all
(select 3 * population
 from world y
 where x.continent = y.continent and population > 0 and name not in (select name from world z where y.continent = z.continent and population >= all(select population from world zz where z.continent = zz.continent and population > 0)))
