-- 1.
SELECT id, title
FROM movie
WHERE yr = 1962

-- 2.
select yr
from movie
where title = 'Citizen Kane'

-- 3.
select id, title, yr
from movie
where title like '%Star Trek%'
order by yr

-- 4.
select id
from actor
where name = 'Glenn Close'

-- 5.
select id
from movie
where title = 'Casablanca'

-- 6.
select name
from movie join casting on movie.id = movieid
join actor on actorid = actor.id
where title = 'Casablanca'

-- 7.
select name
from movie join casting on movie.id = movieid
join actor on actorid = actor.id
where title = 'Alien'

-- 8.
select title
from movie join casting on movie.id = movieid
join actor on actorid = actor.id
where name = 'Harrison Ford'

-- 9.
select title
from movie join casting on movie.id = movieid
join actor on actorid = actor.id
where name = 'Harrison Ford' and ord <> 1

-- 10.
select title, name
from movie join casting on movie.id = movieid
join actor on actorid = actor.id
where yr = 1962 and ord = 1

-- 11.
select yr, count(*)
from movie join casting on movie.id = movieid
join actor on actorid = actor.id
where name = 'Rock Hudson'
group by yr
having count(*) > 2

-- 12.
select title, name
from movie join casting on movie.id = movieid
join actor on actorid = actor.id
where movie.id in
(select movie.id
 from movie join casting on movie.id = movieid
 join actor on actorid = actor.id
 where name = 'Julie Andrews')
and ord = 1

-- 13.
select name
from movie join casting on movie.id = movieid
join actor on actorid = actor.id
where ord = 1
group by name
having count(*) >= 15

-- 14.
select title, count(*)
from movie join casting on movie.id = movieid
join actor on actorid = actor.id
where yr = 1978
group by title
order by count(*) desc, title

-- 15.
select name
from movie join casting on movie.id = movieid
join actor on actorid = actor.id
where movie.id in
(select movie.id
 from movie join casting on movie.id = movieid
 join actor on actorid = actor.id
 where name = 'Art Garfunkel')
and name <> 'Art Garfunkel'
