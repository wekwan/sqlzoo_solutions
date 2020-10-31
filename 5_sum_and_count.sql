-- 1.
SELECT SUM(population)
FROM world

-- 2.
select distinct(continent)
from world

-- 3.
select sum(gdp)
from world
where continent = 'Africa'

-- 4.
select count(*)
from world
where area >= 1000000

-- 5.
select sum(population)
from world
where name in ('Estonia', 'Latvia', 'Lithuania')

-- 6.
select continent, count(name)
from world
group by continent

-- 7.
select continent, count(name)
from world
where population >= 10000000
group by continent

-- 8.
select continent
from world
group by continent
having sum(population) >= 100000000
