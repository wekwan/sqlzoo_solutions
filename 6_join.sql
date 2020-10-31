-- 1.
SELECT matchid, player FROM goal
WHERE teamid = 'GER'

-- 2.
SELECT id, stadium, team1, team2
FROM game
where id = 1012

-- 3.
SELECT player, teamid, stadium, mdate
FROM game JOIN goal ON (id = matchid)
WHERE teamid = 'GER'

-- 4.
select team1, team2, player
from game join goal on (id = matchid)
where player like 'Mario%'

-- 5.
select player, teamid, coach, gtime
from goal join eteam on (teamid = id)
where gtime <= 10

-- 6.
select mdate, teamname
from game join eteam on (team1 = eteam.id)
where coach = 'Fernando Santos'

-- 7.
select player
from game join goal on (id = matchid)
where stadium = 'National Stadium, Warsaw'

-- 8.
select distinct(player)
from game join goal on (id = matchid)
where (teamid <> team1 and team1 = 'GER')
or (teamid <> team2 and team2 = 'GER')

-- 9.
select teamname, count(*)
from goal join eteam on (teamid = id)
group by teamname

-- 10.
select stadium, count(*)
from game join goal on (id = matchid)
group by stadium

-- 11.
SELECT matchid, mdate, COUNT(*)
FROM game JOIN goal ON matchid = id
WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY matchid, mdate

-- 12.
SELECT matchid, mdate, COUNT(*)
FROM game JOIN goal ON matchid = id
WHERE teamid = 'GER'
GROUP BY matchid, mdate

-- 13.
-- Used a left join since there may be no rows in the goal table for a particular game, but we still want the game row to produce a result row (e.g. score1 is 0 and score2 is 0).

select mdate, team1,
sum(case when teamid = team1 then 1 else 0 end) score1,
team2,
sum(case when teamid = team2 then 1 else 0 end) score2
from game left join goal on matchid = id
group by mdate, team1, team2
order by mdate, matchid, team1, team2
