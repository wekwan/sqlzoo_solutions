-- 1.
select count(*)
from stops

-- 2.
select id
from stops
where name = 'Craiglockhart'

-- 3.
select id, name
from stops join route on id = stop
where num = '4' and company = 'LRT'

-- 4.
SELECT company, num, COUNT(*)
FROM route
WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) = 2

-- 5.
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num)
JOIN stops x on a.stop = x.id
JOIN stops y on b.stop = y.id
WHERE x.name = 'Craiglockhart' AND y.name = 'London Road'

-- 6.
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
(a.company=b.company AND a.num=b.num)
JOIN stops stopa ON (a.stop=stopa.id)
JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name = 'London Road'

-- 7.
SELECT DISTINCT(a.company), a.num
FROM route a JOIN route b ON
(a.company=b.company AND a.num=b.num)
JOIN stops stopa ON (a.stop=stopa.id)
JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name = 'Haymarket' and stopb.name = 'Leith'

-- 8.
select distinct(a.company), a.num
from route a join route b
on a.company = b.company and a.num = b.num
join stops stopa on a.stop = stopa.id
join stops stopb on b.stop = stopb.id
where stopa.name = 'Craiglockhart' and stopb.name = 'Tollcross'

-- 9.
-- Get all the routes from Craiglockhart to somewhere else in the first query. Get all the routes from Lochend to somewhere else in the second query. Join them together on where they transfer.

select S.num, S.company, S.name, E.num, E.company
from
(select distinct a.num, a.company, stopb.name
 from route a join route b on a.num = b.num and a.company = b.company
 join stops stopa on stopa.id = a.stop
 join stops stopb on stopb.id = b.stop
 where stopa.name = 'Craiglockhart' and stopb.name <> 'Craiglockhart') as S
join
(select c.num, c.company, stopd.name
 from route c join route d on c.num = d.num and c.company = d.company
 join stops stopc on stopc.id = c.stop
 join stops stopd on stopd.id = d.stop
 where stopc.name = 'Lochend' and stopd.name <> 'Lochend') as E
on S.name = E.name
order by S.num, S.name, E.num
