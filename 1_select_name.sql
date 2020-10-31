-- 1.
SELECT name FROM world
WHERE name LIKE 'Y%'

-- 2.
SELECT name FROM world
WHERE name LIKE '%y'

-- 3.
SELECT name FROM world
WHERE name LIKE '%x%'

-- 4.
SELECT name FROM world
WHERE name LIKE '%land'

-- 5.
SELECT name FROM world
WHERE name LIKE 'C%ia'

-- 6.
SELECT name FROM world
WHERE name LIKE '%oo%'

-- 7.
SELECT name FROM world
WHERE name LIKE '%a%a%a%'

-- 8.
SELECT name FROM world
WHERE name LIKE '_t%'
ORDER BY name

-- 9.
SELECT name FROM world
WHERE name LIKE '%o__o%'

-- 10.
SELECT name FROM world
WHERE name LIKE '____'

-- 11.
SELECT name
FROM world
WHERE capital = name

-- 12.
SELECT name
FROM world
WHERE capital = concat(name, ' City')

-- 13.
select capital, name
from world
where capital like concat(name, '%')

-- 14.
select capital, name
from world
where capital like concat(name, '_%')

-- 15.
select name, replace(capital, name, '') as ext
from world
where capital like concat(name, '_%')
